// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

namespace System.Agents.TaskPane;

using System.Agents;

page 2000000103 "Agent Task Items"
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = "Agent Task Timeline";
    Caption = 'Agent Task Items';
    Editable = true;
    InsertAllowed = false;
    DeleteAllowed = false;
    Extensible = false;
    InherentEntitlements = X;
    InherentPermissions = X;

    layout
    {
        area(Content)
        {
            repeater(Tasks)
            {
                Editable = false;
                field(TaskId; Rec."Task ID")
                {
                }
                field(AgentId; Rec."Agent User Security ID")
                {
                }
                field(TaskNeedsAttention; Rec."Needs Attention")
                {
                }
                field(TaskIndicator; Rec.Indicator)
                {
                }
                field(TaskStatus; Rec.Status)
                {
                }
                field(TaskHeader; Rec.Title)
                {
                    Caption = 'Header';
                    ToolTip = 'Specifies the header of the task.';
                }
                field(TaskSummary; GlobalTaskSummary)
                {
                    Caption = 'Summary';
                    ToolTip = 'Specifies the summary of the task.';
                }
                field(TaskStartedOn; Rec.SystemCreatedAt)
                {
                    Caption = 'Started On';
                    ToolTip = 'Specifies the date and time when the task was started.';
                }
                field(TaskCreatedBy; Rec."Created By")
                {
                    Caption = 'Created By';
                    ToolTip = 'Specifies the user who created the task.';
                }
                field(TaskLastStepCompletedOn; Rec."Last Step Timestamp")
                {
                    Caption = 'Last Step Completed On';
                    ToolTip = 'Specifies the date and time when the last step for the task was completed.';
                }
                field(TaskStepType; Rec."Current Step Type")
                {
                    Caption = 'Step Type';
                    ToolTip = 'Specifies the type of the last step.';
                }
                field(TaskPrimaryTimelineStepCount; Rec."Primary Timeline Step Count")
                {
                    Caption = 'Primary Timeline Step Count';
                    ToolTip = 'Specifies the count of primary timeline steps.';
                }
                field(TaskSecondaryTimelineStepCount; Rec."Secondary Timeline Step Count")
                {
                    Caption = 'Secondary Timeline Step Count';
                    ToolTip = 'Specifies the count of secondary timeline steps.';
                }
                field(TaskCurrentPageExists; Rec."Current Page Exists")
                {
                    Caption = 'Current Page Exists';
                    ToolTip = 'Indicates whether the current page associated with this timeline step exists.';
                }
                field(TaskCurrentPageQuery; GlobalCurrentPageQuery)
                {
                    Caption = 'Current Page Query';
                    ToolTip = 'Specifies the client query string of the page associated with the current timeline step.';
                }
                field(TaskCanStopTask; GlobalCanStopTask)
                {
                    Caption = 'Can Stop Task';
                    ToolTip = 'Indicates whether the stop task action is enabled for this task.';
                }
                field(TaskCanReviewTask; GlobalCanReviewTask)
                {
                    Caption = 'Can Review Task';
                    ToolTip = 'Indicates whether the review task action is enabled for this task.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(StopTask)
            {
                ApplicationArea = All;
                Caption = 'Stop task';
                ToolTip = 'Stops the task.';
                Scope = Repeater;
                trigger OnAction()
                var
                    AgentTaskRecord: Record "Agent Task";
                begin
                    AgentTaskRecord.Get(Rec."Task ID");
                    AgentTask.StopTask(AgentTaskRecord, AgentTaskRecord."Status"::"Stopped by User", false);
                end;
            }
            action(StopAllTasks)
            {
                ApplicationArea = All;
                Caption = 'Stop all tasks';
                ToolTip = 'Stops all tasks that need attention for this agent, so they no longer require action.';
                trigger OnAction()
                var
                    AgentTaskRecord: Record "Agent Task";
                begin
                    AgentTask.StopAllNeedsAttentionTasks(Rec."Agent User Security ID", AgentTaskRecord."Status"::"Stopped by User", true);
                end;
            }
            action(ShowNeedsAttentionTasks)
            {
                ApplicationArea = All;
                Caption = 'More needs attention tasks available';
                ToolTip = 'More needs attention tasks are available. View all needs attention tasks on a separate page.';
                RunObject = page "Agent Tasks List";
                RunPageLink = "Agent User Security ID" = field("Agent User Security ID");
                RunPageView = sorting("Last Step Timestamp") order(ascending) where("Needs Attention" = const(true));
            }
            action(ShowRecentTasks)
            {
                ApplicationArea = All;
                Caption = 'More recent tasks available';
                ToolTip = 'More recent tasks are available. View all recent tasks on a separate page.';
                RunObject = page "Agent Tasks List";
                RunPageLink = "Agent User Security ID" = field("Agent User Security ID");
                RunPageView = sorting("Last Step Timestamp") order(descending) where("Needs Attention" = const(false));
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        SetTaskDetails();
    end;

    local procedure SetTaskDetails()
    var
        SummaryJson: BigText;
        InStream: InStream;
    begin
        Clear(GlobalTaskSummary);
        Clear(GlobalCurrentPageQuery);

        if Rec.CalcFields("Summary", "Current Page Query") then begin
            if Rec."Summary".HasValue() then begin
                Rec."Summary".CreateInStream(InStream, AgentTask.GetDefaultEncoding());
                SummaryJson.Read(InStream);
                GlobalTaskSummary := AgentTask.FormatTimelineStepSummary(Format(SummaryJson), Rec."Current Step Type");
                Clear(InStream);
            end;
            if Rec."Current Page Query".HasValue() then begin
                Rec."Current Page Query".CreateInStream(InStream, AgentTask.GetDefaultEncoding());
                GlobalCurrentPageQuery.Read(InStream);
                Clear(InStream);
            end;
        end;

        GlobalCanReviewTask := AgentTask.CanReviewTask(Rec."Task ID", Rec.Indicator, Rec."Current Page Exists", GlobalCurrentPageQuery);
        GlobalCanStopTask := AgentTask.CanStopTask(Rec."Task ID", Rec.Indicator, Rec."Needs Attention");
    end;

    var
        AgentTask: Codeunit "Agent Task Internal";
        GlobalCurrentPageQuery: BigText;
        GlobalTaskSummary: Text;
        GlobalCanReviewTask: Boolean;
        GlobalCanStopTask: Boolean;
}
