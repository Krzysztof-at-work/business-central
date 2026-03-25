// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

namespace System.Environment.Configuration;

/// <summary>
/// Provides functionality for managing designer configurations.
/// </summary>
codeunit 2000000028 "Designer Utilities"
{
    /// <summary>
    /// Recompiles the customizations for the profiles and users for which a recompilation is needed.
    /// </summary>
    /// <returns>Returns true if customizations are all up-to-date or all successfully recompiled; otherwise, false.</returns>
    [Native]
    procedure RepairAllCustomizationsIfNeeded() Success: Boolean
    begin
    end;
}