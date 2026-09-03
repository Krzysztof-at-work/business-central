// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

namespace System.Agents;

using System.Agents.TaskPane;

page 2000000104 "Agent Tasks List"
{
    ApplicationArea = All;
    PageType = List;
    SourceTable = "Agent Task Timeline";
    Caption = 'Agent Tasks';
    Editable = false;
    Extensible = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    InherentEntitlements = X;
    InherentPermissions = X;

    layout
    {
        area(Content)
        {
            repeater(Tasks)
            {
                field("Task ID"; Rec."Task ID")
                {
                    ApplicationArea = All;
                    Caption = 'Task ID';
                    ToolTip = 'Specifies the ID of the agent task.';
                    ExtendedDatatype = Task;

                    trigger OnDrillDown()
                    begin
                        TaskPane.ShowTask(Rec."Task ID");
                    end;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Caption = 'Status';
                    ToolTip = 'Specifies the status of the agent task.';
                }
                field("Needs Attention"; Rec."Needs Attention")
                {
                    ApplicationArea = All;
                    Caption = 'Needs Attention';
                    ToolTip = 'Indicates whether the agent task needs attention.';
                }
                field(TaskCreatedBy; Rec.SystemCreatedAt)
                {
                    ApplicationArea = All;
                    Caption = 'Started';
                    ToolTip = 'Specifies the date and time when the agent task was started.';
                }
                field("Last Step Timestamp"; Rec."Last Step Timestamp")
                {
                    ApplicationArea = All;
                    Caption = 'Last Updated';
                    ToolTip = 'Specifies the date and time when the agent task was last updated.';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                    Caption = 'Title';
                    ToolTip = 'Specifies the title of the agent task.';
                }
                field(Summary; GlobalSummary)
                {
                    ApplicationArea = All;
                    Caption = 'Summary';
                    ToolTip = 'Specifies the summary of the agent task.';
                }
                field(AgentName; GlobalAgentName)
                {
                    ApplicationArea = All;
                    Caption = 'Agent';
                    ToolTip = 'Specifies the name of the agent assigned to the agent task.';
                }
            }
        }
    }

    actions
    {
        area(Promoted)
        {
            actionref(ShowTaskRef; ShowTask)
            {
            }
            actionref(ReviewTaskRef; ReviewTask)
            {
            }
            actionref(StopTaskRef; StopTask)
            {
            }
        }
        area(Processing)
        {
            action(ShowTask)
            {
                ApplicationArea = All;
                Caption = 'Show task';
                ToolTip = 'Show the agent task.';
                Image = Timeline;
                Scope = Repeater;
                Enabled = EnableShowTask;
                trigger OnAction()
                begin
                    if Rec."Task ID" = 0 then
                        exit;

                    TaskPane.ShowTask(Rec."Task ID");
                end;
            }
            action(ReviewTask)
            {
                ApplicationArea = All;
                Caption = 'Review task';
                ToolTip = 'Review the agent task.';
                Image = View;
                Scope = Repeater;
                Enabled = EnableReviewTask;
                trigger OnAction()
                begin
                    if Rec."Task ID" = 0 then
                        exit;

                    TaskPane.ReviewTask(Rec."Task ID");
                end;
            }
            action(StopTask)
            {
                ApplicationArea = All;
                Caption = 'Stop task';
                ToolTip = 'Stop the agent task.';
                Image = Reject;
                Scope = Repeater;
                Enabled = EnableStopTask;
                trigger OnAction()
                var
                    Task: Record "Agent Task Timeline";
                    AgentTaskRecord: Record "Agent Task";
                begin
                    CurrPage.SetSelectionFilter(Task);

                    if not Task.FindSet() then
                        exit;

                    if not Confirm(AreYouSureThatYouWantToStopTheTasksQst) then
                        exit;

                    repeat
                        if AgentTaskRecord.Get(Task."Task ID") then
                            AgentTask.StopTask(AgentTaskRecord, AgentTaskRecord."Status"::"Stopped by User", false);
                    until Task.Next() = 0;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        SetAgentName();
        SetTaskDetails();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        EnableShowTask := AgentTask.CanShowTask(Rec."Task ID");
        EnableReviewTask := AgentTask.CanReviewTask(Rec."Task ID", Rec.Indicator, Rec."Current Page Exists", GlobalCurrentPageQuery);
        EnableStopTask := AgentTask.CanStopTask(Rec."Task ID", Rec.Indicator, Rec."Needs Attention");
    end;

    local procedure SetAgentName()
    var
        Agent: Record Agent;
    begin
        Clear(GlobalAgentName);

        if not Agent.ReadPermission() then exit;

        if Agent.Get(Rec."Agent User Security ID") then
            GlobalAgentName := Agent."Display Name";
    end;

    local procedure SetTaskDetails()
    var
        SummaryJson: BigText;
        CurrentPageQuery: BigText;
        InStream: InStream;
    begin
        Clear(GlobalSummary);
        Clear(GlobalCurrentPageQuery);

        if Rec.CalcFields("Summary", "Current Page Query") then begin
            if Rec."Summary".HasValue() then begin
                Rec."Summary".CreateInStream(InStream, AgentTask.GetDefaultEncoding());
                SummaryJson.Read(InStream);
                GlobalSummary := AgentTask.FormatTimelineStepSummary(Format(SummaryJson), Rec."Current Step Type");
                Clear(InStream);
            end;
            if Rec."Current Page Query".HasValue() then begin
                Rec."Current Page Query".CreateInStream(InStream, AgentTask.GetDefaultEncoding());
                CurrentPageQuery.Read(InStream);
                GlobalCurrentPageQuery := CurrentPageQuery;
                Clear(InStream);
            end;
        end;
    end;

    var
        AgentTask: Codeunit "Agent Task Internal";
        TaskPane: Codeunit "Task Pane";
        GlobalCurrentPageQuery: BigText;
        GlobalAgentName: Text;
        GlobalSummary: Text;
        EnableShowTask: Boolean;
        EnableReviewTask: Boolean;
        EnableStopTask: Boolean;
        AreYouSureThatYouWantToStopTheTasksQst: Label 'Are you sure you want to stop the selected task(s)?';
}
