// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

namespace System.Agents;

/// <summary>
/// Provides core functionality for managing agent tasks within Business Central.
/// This codeunit handles task operations such as stopping tasks, encoding management, and task status updates.
/// </summary>
#pragma warning disable AS0090 // Renamed from 'Agent Task' to avoid name conflicts
codeunit 2000000018 "Agent Task Internal"
#pragma warning restore AS0090
{
    Access = Internal;
    InherentEntitlements = X;
    InherentPermissions = X;

    /// <summary>
    /// Gets the default text encoding used for agent task operations.
    /// </summary>
    /// <returns>The default text encoding (UTF8) used throughout the agent task system.</returns>
    procedure GetDefaultEncoding(): TextEncoding
    begin
        exit(TextEncoding::UTF8);
    end;

    /// <summary>
    /// Stops an agent task by updating its status and clearing attention flags.
    /// </summary>
    /// <param name="AgentTask">The agent task record to be stopped. Passed by reference and will be modified.</param>
    /// <param name="AgentTaskStatus">The target status to set for the agent task when stopping it.</param>
    /// <param name="UserConfirm">Specifies whether to show a confirmation dialog to the user before stopping the task.</param>
    [Scope('OnPrem')]
    procedure StopTask(var AgentTask: Record "Agent Task"; AgentTaskStatus: enum "Agent Task Status"; UserConfirm: Boolean)
    begin
        if ((AgentTask.Status = AgentTaskStatus) and (AgentTask."Needs Attention" = false)) then
            exit; // Task is already stopped and does not need attention.

        if UserConfirm then
            if not Confirm(AreYouSureThatYouWantToStopTheTaskQst) then
                exit;

        AgentTask.Status := AgentTaskStatus;
        AgentTask."Needs Attention" := false;
        AgentTask.Modify(true);
    end;

    /// <summary>
    /// Stops all agent tasks that need attention for the given agent by updating their status and clearing attention flags.
    /// </summary>
    /// <param name="AgentId">The unique identifier of the agent whose tasks are to be stopped.</param>
    /// <param name="AgentTaskStatus">The target status to set for the agent tasks when stopping them.</param>
    /// <param name="UserConfirm">Specifies whether to show a confirmation dialog to the user before stopping all tasks.</param>
    [Scope('OnPrem')]
    procedure StopAllNeedsAttentionTasks(AgentId: Guid; AgentTaskStatus: enum "Agent Task Status"; UserConfirm: Boolean)
    var
        Agent: Record "Agent";
        AgentTask: Record "Agent Task";
    begin
        if UserConfirm then
            if Agent.Get(AgentId) then
                if not Confirm(StrSubstNo(AreYouSureThatYouWantToStopAllTasksQst, Agent."Display Name")) then
                    exit;

        // Filter to tasks that need attention for this agent
        AgentTask.SetRange("Agent User Security ID", AgentId);
        AgentTask.SetRange("Needs Attention", true);

        if AgentTask.FindSet() then
            repeat
                StopTask(AgentTask, AgentTaskStatus, false);
            until AgentTask.Next() = 0;
    end;

    /// <summary>
    /// Determines whether a task can be shown in the agent task pane.
    /// </summary>
    /// <param name="TaskId">The unique identifier of the task.</param>
    /// <returns>True if the task can be shown; otherwise, false.</returns>
    [Scope('OnPrem')]
    procedure CanShowTask(TaskId: BigInteger): Boolean
    begin
        exit(TaskId <> 0);
    end;

    /// <summary>
    /// Determines whether a task can be reviewed in the agent task pane.
    /// </summary>
    /// <param name="TaskId">The unique identifier of the task.</param>
    /// <param name="Indicator">The status indicator of the task.</param>
    /// <param name="CurrentPageExists">Indicates whether the current page exists.</param>
    /// <param name="CurrentPageQuery">The query string of the current page.</param>
    /// <returns>True if the task can be reviewed; otherwise, false.</returns>
    [Scope('OnPrem')]
    procedure CanReviewTask(TaskId: BigInteger; Indicator: Enum "Agent Task Status"; CurrentPageExists: Boolean; CurrentPageQuery: BigText): Boolean
    begin
        exit((TaskId <> 0) and (not ShouldConsiderTaskAsRunning(Indicator)) and IsReviewableFromTaskList(CurrentPageExists, CurrentPageQuery));
    end;

    /// <summary>
    /// Determines whether a task can be stopped in the agent task pane.
    /// </summary>
    /// <param name="TaskId">The unique identifier of the task.</param>
    /// <param name="Indicator">The status indicator of the task.</param>
    /// <param name="NeedsAttention">Indicates whether the task needs attention.</param>
    /// <returns>True if the task can be stopped; otherwise, false.</returns>
    [Scope('OnPrem')]
    procedure CanStopTask(TaskId: BigInteger; Indicator: Enum "Agent Task Status"; NeedsAttention: Boolean): Boolean
    begin
        exit((TaskId <> 0) and (NeedsAttention or (not ShouldConsiderTaskAsStopped(Indicator))));
    end;

    /// <summary>
    /// Formats the summary of an agent task timeline step based on its type.
    /// </summary>
    /// <param name="SummaryJson">The JSON string containing the summary data.</param>
    /// <param name="StepType">The type of the timeline step.</param>
    /// <returns>The formatted summary text.</returns>
    [Scope('OnPrem')]
    procedure FormatTimelineStepSummary(SummaryJson: Text; StepType: Enum "Agent Task Timeline Step Type"): Text
    var
        JsonObject: JsonObject;
        Caption: Text;
        Summary: Text;
    begin
        if not TryParseJson(SummaryJson, JsonObject) then
            exit('');

        case StepType of
            StepType::Default, StepType::UserInterventionRequest:
                FormatPageSummary(JsonObject, Caption, Summary);
            StepType::InputMessage, StepType::OutputMessage:
                FormatMessageSummary(JsonObject, Caption, Summary);
        end;

        exit(JoinCaptionAndSummary(Caption, Summary));
    end;

    /// <summary>
    /// Retrieves the page type from the summary of an agent task timeline step.
    /// </summary>
    /// <param name="SummaryJson">The JSON string containing the summary data.</param>
    /// <param name="StepType">The type of the timeline step.</param>
    /// <returns>The page type as a text string.</returns>
    [Scope('OnPrem')]
    procedure GetTimelineStepSummaryPageType(SummaryJson: Text; StepType: Enum "Agent Task Timeline Step Type"): Text
    var
        JsonObject: JsonObject;
    begin
        if not (StepType in [StepType::Default, StepType::UserInterventionRequest]) then
            exit('');

        if not TryParseJson(SummaryJson, JsonObject) then
            exit('');

        exit(GetJsonStringProperty(JsonObject, 'pageType'));
    end;

    local procedure TryParseJson(SummaryJson: Text; var JsonObject: JsonObject): Boolean
    begin
        if SummaryJson = '' then
            exit(false);

        if not JsonObject.ReadFrom(SummaryJson) then
            exit(false);

        exit(true);
    end;

    local procedure FormatPageSummary(JsonObject: JsonObject; var Caption: Text; var Summary: Text)
    var
        FieldsToken: JsonToken;
        FieldsArray: JsonArray;
        FieldToken: JsonToken;
        FieldObject: JsonObject;
        FieldCaption: Text;
        FieldValue: Text;
        SummaryParts: TextBuilder;
        IsFirst: Boolean;
    begin
        Caption := GetJsonStringProperty(JsonObject, 'pageCaption');

        if not JsonObject.Get('fields', FieldsToken) then
            exit;

        if not FieldsToken.IsArray() then
            exit;

        FieldsArray := FieldsToken.AsArray();
        IsFirst := true;

        foreach FieldToken in FieldsArray do begin
            FieldObject := FieldToken.AsObject();
            FieldCaption := GetJsonStringProperty(FieldObject, 'caption');
            FieldValue := GetJsonStringProperty(FieldObject, 'fieldValue');

            if (FieldCaption <> '') and (FieldValue <> '') then begin
                if not IsFirst then
                    SummaryParts.Append(', ');
                SummaryParts.Append(FieldCaption);
                SummaryParts.Append(': ');
                SummaryParts.Append(FieldValue);
                IsFirst := false;
            end else
                if FieldCaption <> '' then begin
                    if not IsFirst then
                        SummaryParts.Append(', ');
                    SummaryParts.Append(FieldCaption);
                    IsFirst := false;
                end else
                    if FieldValue <> '' then begin
                        if not IsFirst then
                            SummaryParts.Append(', ');
                        SummaryParts.Append(FieldValue);
                        IsFirst := false;
                    end;
        end;

        Summary := SummaryParts.ToText();
    end;

    local procedure FormatMessageSummary(JsonObject: JsonObject; var Caption: Text; var Summary: Text)
    begin
        Caption := GetJsonStringProperty(JsonObject, 'caption');
        Summary := GetJsonStringProperty(JsonObject, 'summary');
    end;

    local procedure JoinCaptionAndSummary(Caption: Text; Summary: Text): Text
    begin
        if (Caption <> '') and (Summary <> '') then
            exit(Caption + '. ' + Summary);
        if Caption <> '' then
            exit(Caption);
        exit(Summary);
    end;

    local procedure GetJsonStringProperty(JsonObject: JsonObject; PropertyName: Text): Text
    var
        JsonToken: JsonToken;
        JsonValue: JsonValue;
    begin
        if not JsonObject.Get(PropertyName, JsonToken) then
            exit('');

        if not JsonToken.IsValue() then
            exit('');

        JsonValue := JsonToken.AsValue();
        if JsonValue.IsNull() or JsonValue.IsUndefined() then
            exit('');

        exit(JsonValue.AsText());
    end;

    local procedure ShouldConsiderTaskAsRunning(Indicator: Enum "Agent Task Status"): Boolean
    begin
        exit(Indicator in [Indicator::Ready, Indicator::Scheduled, Indicator::Running]);
    end;

    local procedure ShouldConsiderTaskAsStopped(Indicator: Enum "Agent Task Status"): Boolean
    begin
        exit(Indicator in [Indicator::"Stopped by User", Indicator::"Stopped by System"]);
    end;

    local procedure IsReviewableFromTaskList(CurrentPageExists: Boolean; CurrentPageQuery: BigText): Boolean
    begin
        exit(CurrentPageExists or (CurrentPageQuery.Length = 0));
    end;

    var
        AreYouSureThatYouWantToStopTheTaskQst: Label 'Are you sure you want to stop the task?';
        AreYouSureThatYouWantToStopAllTasksQst: Label 'All tasks that need attention for %1 will be stopped. Stopped tasks can''t be restarted.\\Are you sure you want to continue?', Comment = '%1 = agent name';
}