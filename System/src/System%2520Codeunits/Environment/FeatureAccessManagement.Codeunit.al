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
        exit(AgentManagementAllowedInternal(ThrowError));
    end;

    /// <summary>
    /// Checks if agent management is allowed in the current environment.
    /// </summary>
    /// <param name="ThrowError">If an error should be thrown if unavailable.</param>
    /// <returns>True if allowed, false otherwise.</returns>
    [Scope('OnPrem')]
    procedure AgentManagementAllowed(ThrowError: Boolean): Boolean
    begin
        exit(AgentManagementAllowedInternal(ThrowError));
    end;

    /// <summary>
    /// Checks if the environment is an evaluation environment or if the code is first-party code.
    /// </summary>
    [Scope('OnPrem')]
    procedure IsSandboxEnvironmentOrFirstPartyCode(ThrowError: Boolean): Boolean
    begin
        exit(IsSandboxEnvironmentOrFirstPartyCodeInternal(ThrowError));
    end;

    /// <summary>
    /// Checks if the current environment is positive listed.
    /// </summary>
    /// <returns>True if yes, false otherwise.</returns>
    [Scope('OnPrem')]
    procedure IsEnvironmentPositiveListed(): Boolean
    begin
        exit(IsEnvironmentPositiveListedInternal());
    end;

    /// <summary>
    /// Checks if the environment is a sandbox environment.
    /// </summary>
    procedure IsSandboxEnvironment(): Boolean
    begin
        exit(IsSandboxEnvironmentInternal());
    end;

    /// <summary>
    /// Checks if the current session is running in the context of a test.
    /// </summary>
    /// <returns>True if a test is executing, false otherwise.</returns>
    [Scope('OnPrem')]
    procedure IsTestSession(): Boolean
    begin
        exit(IsTestSessionInternal());
    end;

    [Native]
    local procedure AgentManagementAllowedInternal(ThrowError: Boolean): Boolean
    begin
    end;

    [Native]
    local procedure IsSandboxEnvironmentOrFirstPartyCodeInternal(ThrowError: Boolean): Boolean
    begin
    end;

    [Native]
    local procedure IsSandboxEnvironmentInternal(): Boolean
    begin
    end;

    [Native]
    local procedure IsEnvironmentPositiveListedInternal(): Boolean
    begin
    end;

    [Native]
    local procedure IsTestSessionInternal(): Boolean
    begin
    end;
}