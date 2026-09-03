// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

namespace System.Agents;

using System.Security.AccessControl;

codeunit 2000000022 "Agent Utilities"
{
    InherentEntitlements = X;
    InherentPermissions = X;

    /// <summary>
    /// Set the instructions for the specified agent.
    /// </summary>
    /// <param name="agentUserId">The agent user ID.</param>
    /// <param name="instructions">The instructions.</param>
    [Native]
    [Scope('OnPrem')]
    procedure SetInstructions(AgentUserID: Guid; Instructions: SecretText)
    begin
    end;

    /// <summary>
    /// Get the instructions for the specified agent.
    /// </summary>
    /// <param name="agentUserId">The agent user ID.</param>
    [Native]
    [Scope('OnPrem')]
    procedure GetInstructions(AgentUserID: Guid): SecretText
    begin
    end;

    /// <summary>
    /// Get whether the current session is an agent session.
    /// </summary>
    /// <param name="ActiveAgentMetadataProvider"></param>
    /// <returns>True if the current session is an agent session; otherwise, false.</returns>
    [Scope('OnPrem')]
    procedure IsAgentSession(var ActiveAgentMetadataProvider: Enum "Agent Metadata Provider"): Boolean
    var
        AgentType: Integer;
    begin
        if not GuiAllowed() then
            exit(false);

        AgentType := GetCurrentSessionAgentMetadataProviderType();
        if AgentType < 0 then
            exit(false);

        ActiveAgentMetadataProvider := "Agent Metadata Provider".FromInteger(AgentType);
        exit(true);
    end;

    /// <summary>
    /// Raise an error dialog if the current session is an agent session.
    /// </summary>
    [Scope('OnPrem')]
    procedure BlockPageFromBeingOpenedByAgent()
    var
        AgentMetadataProvider: Enum "Agent Metadata Provider";
        ThisPageCannotBeOpenedByAnAgentErr: Label 'This page cannot be opened by an agent.', Locked = true;
    begin
        if IsAgentSession(AgentMetadataProvider) then
            Error(ThisPageCannotBeOpenedByAnAgentErr);
    end;

    /// <summary>
    /// Get the agent task ID related to the current session, if any, 0 otherwise.
    /// </summary>
    /// <returns>The agent task ID, if any, 0 otherwise.</returns>
    [Native]
    [Scope('OnPrem')]
    procedure GetCurrentSessionAgentTaskId(): Integer
    begin
    end;

    /// <summary>
    /// Get the agent metadata provider type for the current session, if any, -1 otherwise.
    /// </summary>
    /// <returns>The agent metadata provider type, if any, -1 otherwise.</returns>
    [Native]
    [Scope('OnPrem')]
    procedure GetCurrentSessionAgentMetadataProviderType(): Integer
    begin
    end;

    /// <summary>
    /// Replaces the existing access controls for the agent with those provided in the buffer.
    /// </summary>
    /// <remarks>
    /// This removes any existing access controls assigned to the agent and replaces them.
    /// </remarks>
    /// <param name="AgentUserSecurityId">The agent user security ID.</param>
    /// <param name="TempAccessControlBuffer">The temporary access control buffer.</param>
    [Native]
    [Scope('OnPrem')]
    procedure UpdateAccessControl(AgentUserSecurityId: Guid; var TempAccessControlBuffer: Record "Access Control Buffer" temporary)
    begin
    end;

    /// <summary>
    /// Replaces the existing access controls for the custom agent with those provided in the buffer.
    /// </summary>
    /// <remarks>
    /// This removes any existing access controls assigned to the agent and replaces them.
    /// To be removed in favor of UpdateAccessControl.
    /// </remarks>
    /// <param name="AgentUserSecurityId">The agent user security ID.</param>
    /// <param name="TempAccessControlBuffer">The temporary access control buffer.</param>
    [Native]
    [Scope('OnPrem')]
    procedure UpdateCustomAgentAccessControls(AgentUserSecurityId: Guid; var TempAccessControlBuffer: Record "Access Control Buffer" temporary)
    begin
    end;

    /// <summary>
    /// Deletes the specified custom agent, if the user has sufficient permissions.
    /// </summary>
    /// <param name="AgentUserSecurityId">The agent user security ID.</param>
    [Native]
    [Scope('OnPrem')]
    procedure DeleteCustomAgent(AgentUserSecurityId: Guid)
    begin
    end;

    /// <summary>
    /// Gets the agent publisher info for the specified agent metadata provider.
    /// </summary>
    /// <param name="AgentMetadataProvider">The agent metadata provider.</param>
    /// <param name="AgentPublisherName">The agent publisher name.</param>
    /// <param name="AgentPublisherType">The agent publisher type.</param>
    /// <returns>True if the publisher info could be found, false otherwise.</returns>
    [Native]
    [Scope('OnPrem')]
    procedure TryGetAgentPublisherInfo(AgentMetadataProvider: Enum "Agent Metadata Provider"; var AgentPublisherName: Text[250]; var AgentPublisherType: Enum "Agent Publisher Type"): Boolean
    begin
    end;

    /// <summary>
    /// Gets the agent app info for the specified agent metadata provider.
    /// </summary>
    /// <param name="AgentMetadataProvider">The agent metadata provider.</param>
    /// <param name="AppPublisher">The app publisher name.</param>
    /// <param name="AppName">The app name.</param>
    /// <param name="AppId">The app ID.</param>
    /// <returns>True if the app info could be found, false otherwise.</returns>
    [Native]
    [Scope('OnPrem')]
    procedure TryGetAgentAppInfo(AgentMetadataProvider: Enum "Agent Metadata Provider"; var AppPublisher: Text[250]; var AppName: Text[250]; var AppId: Guid): Boolean
    begin
    end;

    /// <summary>
    /// Gets whether the current user can configure all agents (i.e. is an agent admin) in all companies.
    /// </summary>
    /// <returns>True if the current user can configure all agents in all companies, false otherwise.</returns>
    [Native]
    [Scope('OnPrem')]
    procedure CurrentUserHasConfigureAllAgentsPermissionInAllCompanies(): Boolean
    begin
    end;

    /// <summary>
    /// Gets whether the Agents feature is enabled for the current environment.
    /// </summary>
    /// <returns>True if the Agents feature is enabled, false otherwise.</returns>
    [Native]
    [Scope('OnPrem')]
    procedure IsAgentsFeatureEnabled(): Boolean
    begin
    end;

    /// <summary>
    /// Gets whether the current user can create agents based on the specified agent metadata provider.
    /// </summary>
    /// <param name="AgentMetadataProvider">The agent metadata provider.</param>
    /// <returns>True if the current user can create agents based on the specified agent metadata provider, false otherwise.</returns>
    [Native]
    [Scope('OnPrem')]
    procedure CanCurrentUserCreateAgent(AgentMetadataProvider: Enum "Agent Metadata Provider"): Boolean
    begin
    end;

    /// <summary>
    /// Gets the total Copilot credits consumed by the agent task.
    /// </summary>
    /// <param name="TaskId">The ID of the agent task to get consumed credits for.</param>
    /// <returns>The total Copilot credits consumed by the agent task.</returns>
    [Native]
    [Scope('OnPrem')]
    procedure GetConsumedCopilotCredits(TaskId: BigInteger): Decimal
    begin
    end;
}