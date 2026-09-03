// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

namespace System.Database;
using System.Diagnostics;
using System.Reflection;

/// <summary>
/// Provides an API for various index management operations.
/// </summary>
codeunit 2000000029 "Index Management"
{
    Access = Public;
    InherentEntitlements = X;
    InherentPermissions = X;

    /// <summary>
    /// Gets the list of supported LCIDs for optimized text search.
    /// </summary>
    /// <returns>A list of LCIDs supported for optimized text search.</returns>
    [Native]
    procedure GetSupportedOptimizedTextSearchLanguages(): Dictionary of [Integer, Text]
    begin
    end;

    /// <summary>
    /// Gets the current optimized text search language.
    /// </summary>
    /// <returns>The LCID of the current optimized text search language.</returns>
    [Native]
    procedure GetCurrentOptimizedTextSearchLanguage() Lcid: Integer
    begin
    end;

    /// <summary>
    /// Sets the current optimized text search language.
    /// </summary>
    /// <param name="Lcid">The LCID to set as the current optimized text search language.</param>
    [Native]
    [Scope('OnPrem')]
    procedure SetCurrentOptimizedTextSearchLanguage(Lcid: Integer)
    begin
    end;

    /// <summary>
    /// Disables the index of the current Database Index record.
    /// Indexes that are primary key, unique (including SystemId), or SIFT cannot be disabled.
    /// </summary>
    /// <param name="DatabaseIndexRecord">The DatabaseIndex record identifying the index to disable.</param>
    [Native]
    [Scope('OnPrem')]
    procedure DisableIndex(DatabaseIndexRecord: Record "Database Index")
    begin
    end;

    /// <summary>
    /// Enables the corresponding index of the current Key record.
    /// </summary>
    /// <param name="KeyRecord">The Key table record identifying the key to enable.</param>
    /// <param name="CompanyName"> The name of the company for which to enable a key in SQL. Use empty if a not a per company table</param>
    [Native]
    [Scope('OnPrem')]
    procedure EnableKey(KeyRecord: Record "Key"; CompanyName: Text[30])
    begin
    end;
}