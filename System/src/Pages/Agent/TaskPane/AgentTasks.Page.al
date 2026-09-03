// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

namespace System.Agents.TaskPane;

using System.Agents;

page 2000000100 "Agent Tasks"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "Agent Task Timeline";
    Caption = 'Agent Tasks Pane';
    Editable = true;
    InsertAllowed = false;
    DeleteAllowed = false;
    Extensible = false;
    InherentEntitlements = X;
    InherentPermissions = X;

    layout
    {
        area(FactBoxes)
        {
            part(NeedsAttention; "Agent Task Items")
            {
                Caption = 'Needs Attention';
                SubPageLink = "Agent User Security ID" = field("Agent User Security ID");
                SubPageView = sorting("Last Step Timestamp") order(ascending) where("Needs Attention" = const(true));
                Editable = true;
            }
            part(Recent; "Agent Task Items")
            {
                Caption = 'Recent';
                SubPageLink = "Agent User Security ID" = field("Agent User Security ID");
                SubPageView = sorting("Last Step Timestamp") order(descending) where("Needs Attention" = const(false));
                Editable = true;
            }
            part(Timeline; "Agent Task Timeline")
            {
                Caption = 'Timeline';
                Provider = NeedsAttention;
                SubPageLink = "Task ID" = field("Task ID");
                Editable = true;
            }
            part(Details; "Agent Task Details")
            {
                Caption = 'Details';
                Provider = Timeline;
                SubPageLink = "Task ID" = field("Task ID"), "Timeline Step ID" = field(ID);
                Editable = true;
            }
        }
    }
}