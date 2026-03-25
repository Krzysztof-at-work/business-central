// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

namespace System.Environment;

/// <summary>
/// Provides functionality related to access to features.
/// </summary>
codeunit 2000000020 "Feature Access Management"
{
    InherentEntitlements = X;
    InherentPermissions = X;
    SingleInstance = true;

    /// <summary>
    /// Checks if the agent task management preview feature is enabled.
    /// </summary>
    /// <param name="ThrowError">If an error should be thrown if unavailable.</param>
    /// <returns>True if enabled, false otherwise.</returns>
    [Scope('OnPrem')]
    procedure AgentTaskManagementPreviewEnabled(ThrowError: Boolean): Boolean
    begin
        exit(AgentTaskManagementPreviewEnabledInternal(ThrowError));
    end;

    [Native]
    local procedure AgentTaskManagementPreviewEnabledInternal(ThrowError: Boolean): Boolean
    begin
    end;
}