// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

namespace System.Apps;

/// <summary>
/// Provides operations for managing extension database schema tracking state.
/// </summary>
codeunit 2000000030 "Extension Database Management"
{
    Access = Public;
    InherentEntitlements = X;
    InherentPermissions = X;

    /// <summary>
    /// Marks all synced extension data where the extension is not currently installed as reviewed.
    /// This indicates the orphaned data has been acknowledged and intentionally kept.
    /// </summary>
    [Scope('OnPrem')]
    procedure MarkAllOrphanedExtensionDataAsReviewed()
    begin
        MarkAllOrphanedExtensionDataAsReviewedInternal();
    end;

    [Native]
    local procedure MarkAllOrphanedExtensionDataAsReviewedInternal()
    begin
    end;
}
