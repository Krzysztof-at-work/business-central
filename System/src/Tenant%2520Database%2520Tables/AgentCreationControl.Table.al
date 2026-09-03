// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace System.Agents;

using System.Environment;
using System.Security.AccessControl;

/// <summary>
/// Manages access creation permissions for AI agents, defining which non-admin users can create specific agents.
/// </summary>
/// <remarks>
/// This table establishes the security model for agent creation by linking users with specific agents
/// and their configuration permissions per company. Used by the agent framework to enforce security
/// policies and ensure only authorized users can create agents.
/// </remarks>
table 2000000297 "Agent Creation Control"
{
    Caption = 'Agent Creation Control';
    ReplicateData = false;
    DataPerCompany = false;
    Scope = OnPrem;

    fields
    {
        /// <summary>
        /// Auto-incremented unique identifier of the agent creation permission rule.
        /// </summary>
        field(1; "ID"; Integer)
        {
            Caption = 'ID';
            AutoIncrement = true;
        }
        /// <summary>
        /// User to whom the permission applies; empty Guid means all users.
        /// </summary>
        field(2; "User Security ID"; Guid)
        {
            Caption = 'User Security ID';
            ToolTip = 'Specifies the user allowed to create agents. Empty Guid means all users.';
            TableRelation = User."User Security ID";
        }
        /// <summary>
        /// Name of the selected user, calculated from the User table.
        /// </summary>
        field(3; "User Name"; Code[50])
        {
            Caption = 'User Name';
            ToolTip = 'Specifies the name of the user with this permission.';
            FieldClass = FlowField;
            CalcFormula = lookup(User."User Name" where("User Security ID" = field("User Security ID")));
            Editable = false;
        }
        /// <summary>
        /// Agent metadata provider allowed by the rule; -1 means all providers.
        /// </summary>
        field(4; "Agent Metadata Provider"; Integer)
        {
            Caption = 'Agent Metadata Provider';
            ToolTip = 'Specifies the agent metadata provider allowed to be created. -1 means all providers.';
        }
        /// <summary>
        /// Company where the permission applies; empty value means all companies.
        /// </summary>
        field(5; "Company Name"; Text[30])
        {
            Caption = 'Company Name';
            ToolTip = 'Specifies the company where this permission applies. Empty value means all companies.';
            TableRelation = Company.Name;
        }
        /// <summary>
        /// Optional description of the agent creation permission rule.
        /// </summary>
        field(6; "Description"; Text[250])
        {
            Caption = 'Description';
            ToolTip = 'Specifies an optional description for this permission rule.';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "ID")
        {
            Clustered = true;
        }
        key(Lookup; "Company Name", "Agent Metadata Provider", "User Security ID")
        {
            Unique = true;
        }
    }

    procedure IsAllAgentTypes(): Boolean
    begin
        exit("Agent Metadata Provider" = -1);
    end;

    procedure IsAllUsers(): Boolean
    begin
        exit(IsNullGuid("User Security ID"));
    end;

    procedure IsAllCompanies(): Boolean
    begin
        exit("Company Name" = '');
    end;
}
