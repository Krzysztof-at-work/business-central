// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace System.Agents;

using System.Environment;
using System.Security.AccessControl;

/// <summary>
/// Virtual table that provides read-only consumption data for agent task execution, tracking credit usage and billing events.
/// It provides a view of <see cref="User AI Consumption Data"/> focused on agent tasks with agent access control policies applied. 
/// </summary>
/// <remarks>
/// This table logs consumption events generated during agent task execution, capturing credit charges,
/// feature attribution, and action descriptions for auditing and cost tracking purposes.
/// Each entry links to an agent task and records the Copilot credits consumed, the feature responsible,
/// and the user context. Essential for billing transparency, consumption monitoring, and governance
/// of AI-powered agent operations. The table is scoped to OnPrem and not replicated for security considerations.
/// </remarks>
table 2000000247 "Agent Task Consumption"
{
    Caption = 'Agent Task Consumption';
    DataPerCompany = false;
    ReplicateData = false;
    InherentPermissions = RX;
    InherentEntitlements = RX;
    Scope = OnPrem;

    fields
    {
        /// <summary>
        /// The unique identifier of the agent task associated with this consumption entry.
        /// </summary>
        field(1; "Task Id"; BigInteger)
        {
            Caption = 'Agent Task Id';
            Editable = false;
            TableRelation = "Agent Task".Id;
            ToolTip = 'Specifies the agent task related to the consumption, if applicable.';
        }
        /// <summary>
        /// The unique auto-incrementing identifier for this consumption entry.
        /// </summary>
        /// <remarks>
        /// This ID is sourced directly from <see cref="User AI Consumption Data"/>. As the current user/session might not have access
        /// to see all consumption entries from the source table, this field value is likely not sequential.
        /// </remarks>
        field(2; Id; BigInteger)
        {
            Caption = 'Id';
            Editable = false;
            ToolTip = 'Specifies the unique identifier for this consumption entry.';
        }
        /// <summary>
        /// The security identifier of the agent user who consumed the credits.
        /// </summary>
        field(3; "Agent User Security Id"; Guid)
        {
            DataClassification = EndUserPseudonymousIdentifiers;
            Caption = 'Agent User Security Id';
            Editable = false;
            NotBlank = true;
            TableRelation = Agent."User Security ID";
            ToolTip = 'Specifies the user who consumed the credits.';
        }
        /// <summary>
        /// The name of the company context in which the consumption occurred.
        /// </summary>
        field(4; "Company Name"; Text[30])
        {
            Caption = 'Company Name';
            DataClassification = OrganizationIdentifiableInformation;
            Editable = false;
            TableRelation = Company."Name";
            ToolTip = 'Specifies the company in which the consumption occurred.';
        }
        /// <summary>
        /// The date and time when the consumption event occurred, in UTC.
        /// </summary>
        field(5; "Consumption Timestamp"; DateTime)
        {
            Caption = 'Consumption Timestamp';
            Editable = false;
            NotBlank = true;
            ToolTip = 'Specifies when the credits were consumed (UTC).';
        }
        /// <summary>
        /// The name of the feature that consumed the credits, such as "Sales Order Agent".
        /// </summary>
        field(6; "Feature Name"; Text[256])
        {
            Caption = 'Feature Name';
            Editable = false;
            NotBlank = true;
            ToolTip = 'Specifies the feature name that consumed the credits, for example, "Sales Order Agent".';
        }
        /// <summary>
        /// A textual representation of the operations the charge corresponds to, such as "Created Sales Order".
        /// </summary>
        field(7; "Actions"; Text[1024])
        {
            Caption = 'Actions';
            Editable = false;
            ToolTip = 'Specifies what the charge represents, for example, "Created Sales Order".';
        }
        /// <summary>
        /// The amount of Copilot credits consumed by this event.
        /// </summary>
        field(8; "Copilot Credits"; Decimal)
        {
            Caption = 'Copilot Credits';
            AutoFormatType = 0;
            DecimalPlaces = 0 : 2;
            Editable = false;
            NotBlank = true;
            ToolTip = 'Specifies the amount of Copilot credits consumed.';
        }
        /// <summary>
        /// Additional details about the consumption event stored as binary data.
        /// </summary>
        field(9; Description; Blob)
        {
            Caption = 'Description';
            DataClassification = OrganizationIdentifiableInformation;
            ToolTip = 'Specifies a description of the consumption event.';
        }
        /// <summary>
        /// The display name of the Copilot Studio feature associated with this charge, such as "Generative answer".
        /// </summary>
        field(10; "Copilot Studio Feature Display Name"; Text[1024])
        {
            Caption = 'Copilot Studio Feature Display Name';
            Editable = false;
            NotBlank = true;
            ToolTip = 'Specifies the Copilot Studio feature display name for the charge, for example "Generative answer".';
        }
        /// <summary>
        /// The App ID of the extension that defined the agent that consumed the credits.
        /// </summary>
        field(11; "Agent App ID"; Guid)
        {
            Caption = 'Agent App ID';
            Editable = false;
            ToolTip = 'Specifies the ID of the extension that defined the agent that consumed the credits.';
        }
        /// <summary>
        /// The App Name of the extension that defined the agent that consumed the credits.
        /// </summary>
        field(12; "Agent App Name"; Text[250])
        {
            Caption = 'Agent App Name';
            Editable = false;
            ToolTip = 'Specifies the name of the app that defined the agent that consumed the credits.';
        }
        /// <summary>
        /// The App Publisher of the extension that defined the agent that consumed the credits.
        /// </summary>
        field(13; "Agent App Publisher"; Text[250])
        {
            Caption = 'Agent App Publisher';
            Editable = false;
            ToolTip = 'Specifies the publisher of the app that defined the agent that consumed the credits.';
        }
        /// <summary>
        /// Specifies the metadata provider of the agent.
        /// </summary>
        field(14; "Agent Metadata Provider"; Enum "Agent Metadata Provider")
        {
            Caption = 'Agent Metadata Provider';
            Editable = false;
            ToolTip = 'Specifies the metadata provider of the agent.';
        }
        /// <summary>
        /// Specifies the display name of the agent.
        /// </summary>
        field(15; "Agent User Display Name"; Text[80])
        {
            CalcFormula = lookup(User."Full Name" where("User Security ID" = field("Agent User Security ID")));
            Caption = 'Display Name';
            FieldClass = FlowField;
        }
        /// <summary>
        /// Specifies the title of the agent task.
        /// </summary>
        field(16; "Task Title"; Text[150])
        {
            CalcFormula = lookup("Agent Task".Title where(ID = field("Task Id")));
            Caption = 'Task Title';
            FieldClass = FlowField;
        }
        /// <summary>
        /// A flag indicating whether or not the consumption entry is excluded from billing.
        /// </summary>
        field(17; "Is Excluded From Billing"; Boolean)
        {
            Caption = 'Is Excluded From Billing';
            Editable = false;
            ToolTip = 'Specifies whether the consumption entry is excluded from billing.';
        }
    }

    keys
    {
        key("Primary Key"; "Task Id", Id)
        {
            Clustered = true;
        }
    }
}