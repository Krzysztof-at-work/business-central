// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace System.Agents.Internal;

using System.Environment;
using System.Security.AccessControl;

/// <summary>
/// Manages access control permissions for AI agents, defining which users can configure specific agents.
/// </summary>
/// <remarks>
/// This table establishes the security model for agent management by linking users with specific agents
/// and their configuration permissions. It enables fine-grained access control over who can modify
/// agent settings, instructions, and properties. Used by the agent framework to enforce security
/// policies and ensure only authorized users can configure agent behavior.
/// </remarks>
table 2000000259 "Agent Access Control Data"
{
    Caption = 'Agent Access Control Data';
    DataPerCompany = false;
    ReplicateData = false;
    Scope = OnPrem;
    Access = Internal;

    fields
    {
        /// <summary>
        /// Security ID of the agent user whose access is being controlled.
        /// </summary>
        field(1; "Agent User Security ID"; Guid)
        {
            Caption = 'Agent User Security ID';
            TableRelation = "Agent Data"."User Security ID";
        }
        /// <summary>
        /// Security ID of the user who has access to configure the agent.
        /// </summary>
        field(2; "User Security ID"; Guid)
        {
            Caption = 'User Security ID';
            TableRelation = "User"."User Security ID";
        }
        /// <summary>
        /// Indicates whether the user has permission to configure the agent's settings and behavior.
        /// </summary>
        field(3; "Can Configure Agent"; Boolean)
        {
            Caption = 'Can Configure Agent';
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

        key(UserSecurityID; "User Security ID")
        {
        }
    }
}