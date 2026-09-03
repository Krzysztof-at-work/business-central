// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
#pragma warning disable AS0007
namespace System.Reflection;

using System.Tooling;

codeunit 2000000017 "Column Picker Helper"
{
    Access = Internal;

    procedure Initialize(var PageTableField: Record "Page Table Field")
    var
        TableMetadata: Record "Table Metadata";
    begin
        if PageTableField.FindFirst() then
            if TableMetadata.Get(PageTableField."Table No") then begin
                if TableMetadata.ObsoleteState = TableMetadata.ObsoleteState::Removed then
                    Error(TableRemovedErr, TableMetadata.Name, TableMetadata.ObsoleteReason);

                // Fill in the information about the selected table to join
                RelatedTableRecRef.Close();
                RelatedTableRecRef.Open(PageTableField."Table No");
                IsRelatedTableIsNotEmpty := RelatedTableRecRef.FindFirst();

                // Filter the pages and fields shown in the repeater control
                FilterRelatedPagesAndFields(PageTableField);
                PageTableField.SetCurrentKey(Name);
                PageTableField.FindFirst();
            end;
    end;

    procedure FilterRelatedFieldsForEmptyPage(var PageTableField: Record "Page Table Field")
    begin
        PageTableField.SetFilter(FieldKind, '%1', PageTableField.FieldKind::TableField);
        PageTableField.SetFilter("Page ID", '%1', PageTableField."Page ID");
    end;


    local procedure FilterRelatedPagesAndFields(var PageTableField: Record "Page Table Field")
    var
        PageMetadata: Record "Page Metadata";
    begin
        // If there are no list or card pages for the selected table, show table fields instead.
        PageMetadata.SetFilter(SourceTable, '%1', PageTableField."Table No");
        PageMetadata.SetFilter(PageType, '%1|%2', PageMetadata.PageType::List, PageMetadata.PageType::Card);

        AreTherePagesAvailable := not PageMetadata.IsEmpty();
        if AreTherePagesAvailable then
            FilterRelatedFieldsForEmptyPage(PageTableField);

        // Filter the fields in the repeater control to show only supported field types and skip system fields.
        PageTableField.SetFilter(Type, '<>%1 & <>%2 & <>%3 & <>%4 & <>%5', PageTableField.Type::BLOB, PageTableField.Type::Media, PageTableField.Type::MediaSet, PageTableField.Type::NotSupported_Binary, PageTableField.Type::TableFilter);
        PageTableField.SetFilter("Table Field Id", '<2000000000');
        PageTableField.FindSet();
    end;

    procedure GetExampleValue(FieldId: Integer): Text
    var
        PageTableFieldFieldRef: FieldRef;
    begin
        if IsRelatedTableIsNotEmpty and RelatedTableRecRef.FieldExist(FieldId) then begin
            PageTableFieldFieldRef := RelatedTableRecRef.Field(FieldId);
            exit(Format(PageTableFieldFieldRef.Value()));
        end;
    end;

    procedure FilterAfterLookup(PageId: Integer; var PageTableField: Record "Page Table Field")
    begin
        PageTableField.SetFilter(FieldKind, '%1', PageTableField.FieldKind::PageFieldBoundToTable);
        PageTableField.SetFilter("Page ID", '%1', PageId);
    end;

    procedure GetAreTherePagesAvailable(): Boolean
    begin
        exit(AreTherePagesAvailable)
    end;

    procedure GetRelatedTableName(): Text
    begin
        exit(RelatedTableRecRef.Name())
    end;

    var
        RelatedTableRecRef: RecordRef;
        AreTherePagesAvailable: Boolean;
        IsRelatedTableIsNotEmpty: Boolean;
        TableRemovedErr: Label 'The related table ''%1'' is no longer available as a data source. %2', Comment = '%1 = Table name, %2 = Obsolete reason';
}
