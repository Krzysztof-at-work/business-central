// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
#pragma warning disable AS0007
namespace System.Reflection;

page 2000000002 "Table Relations Picker"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = "Table Relations Buffer";
    Caption = 'Choose a source page';
    Editable = false;
    ShowFilter = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    LinksAllowed = false;
    Extensible = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Related Table Name"; Rec."Related Table Name")
                {
                    ToolTip = 'Specifies the related table name.';
                }
                field("Field Name"; Rec."Field Name")
                {
                    ToolTip = 'Specifies the field name.';
                }
                field("Related Field Name"; Rec."Related Field Name")
                {
                    ToolTip = 'Specifies the related field name.';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if Rec.IsEmpty() then
            Rec.PopulateFields(Rec."Table ID");
        CurrPage.Update();
    end;
}