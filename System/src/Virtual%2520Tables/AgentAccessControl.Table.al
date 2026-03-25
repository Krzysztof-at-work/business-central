// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace System.Agents;

using System.Environment;
using System.Security.AccessControl;

/// <summary>
/// Virtual table that manages access control permissions for agent operations.
/// </summary>
/// <remarks>
/// This table defines which users have specific permissions to interact with and configure agents.
/// Essential for implementing role-based security for agent management, ensuring that only authorized
/// users can modify agent configurations and settings. The table provides granular permission control
/// for agent administration while maintaining security boundaries between different user roles.
/// Scoped to OnPrem and not replicated for security considerations.
/// </remarks>

table 2000000261 "Agent Access Control"
{
    Caption = 'Agent Access Control';
    DataPerCompany = false;
    ReplicateData = false;
    Scope = Cloud;

    fields
    {
        /// <summary>
        /// The security ID of the agent user whose access is being controlled.
        /// </summary>
        field(1; "Agent User Security ID"; Guid)
        {
            Caption = 'Agent User Security ID';
            TableRelation = Agent."User Security ID";
            Tooltip = 'Specifies the unique identifier for the agent user.';
        }
        /// <summary>
        /// The security ID of the user who is granted access to the agent.
        /// </summary>
        field(2; "User Security ID"; Guid)
        {
            Caption = 'User Security ID';
            TableRelation = "User"."User Security ID";
            Tooltip = 'Specifies the User Security ID of the user associated with this agent.';
        }
        /// <summary>
        /// Indicates whether the user has permission to configure and modify the agent settings.
        /// </summary>
        field(3; "Can Configure Agent"; Boolean)
        {
            Caption = 'Can Configure Agent';
            Tooltip = 'Specifies whether the user can configure this agent.';
        }
        /// <summary>
        /// Name of the company where the permission set assignment applies.
        /// </summary>
        field(4; "Company Name"; Text[30])
        {
            Caption = 'Company Name';
            TableRelation = Company.Name;
            ToolTip = 'Specifies the company context for this access control entry.';
        }
    }

    keys
    {
#pragma warning disable AS0009 // Required to make the table per company
        key(PK; "Agent User Security ID", "User Security ID", "Company Name")
#pragma warning restore AS0009
        {
            Clustered = true;
        }
    }
}
