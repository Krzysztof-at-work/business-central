// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace System.MCP;

/// <summary>
/// Root configuration record for controlling allowed operations against Business Central objects.
/// </summary>
/// <remarks>
/// This table contains the different MCP server configurations, each identified by a unique 'Configuration ID'.
/// </remarks>
table 2000000292 "MCP Configuration"
{
    Caption = 'MCP Configuration';
    DataPerCompany = false;
    ReplicateData = false;
    Scope = OnPrem;
    DataClassification = CustomerContent;

    fields
    {
        /// <summary>
        /// Configuration name.
        /// </summary>
        field(1; Name; Text[100])
        {
            Caption = 'Name';
            ToolTip = 'Specifies the name of the MCP configuration.';
        }

        /// <summary>
        /// Configuration description.
        /// </summary>
        field(2; Description; Text[250])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the description of the MCP configuration.';
        }

        /// <summary>
        /// Use Tool Search Mode.
        /// </summary>
        field(3; EnableDynamicToolMode; Boolean)
        {
            Caption = 'Dynamic Tool Mode';
            ToolTip = 'Specifies whether to enable dynamic tool mode for this MCP configuration. When enabled, clients can search for tools within the configuration dynamically.';
        }

        /// <summary>
        /// Is configuration active.
        /// </summary>
        field(4; Active; Boolean)
        {
            Caption = 'Active';
            ToolTip = 'Specifies whether the MCP configuration is active.';
        }

        /// <summary>
        /// Allow create, update, and delete tools.
        /// </summary>
        field(5; AllowProdChanges; Boolean)
        {
            Caption = 'Unblock Edit Tools';
            ToolTip = 'Allows create, update and delete tools for the specified MCP configuration. Disallowing this will make the tools read-only.';
        }

        /// <summary>
        /// Allow discovery of accessible read-only objects by the MCP client.
        /// </summary>
        field(6; DiscoverReadOnlyObjects; Boolean)
        {
            Caption = 'Discover Additional Objects';
            ToolTip = 'Specifies whether to allow discovery of read-only objects not defined in the configuration. Only supported with dynamic tool mode.';
        }
    }

    keys
    {
        key(PK; Name)
        {
            Clustered = true;
        }
    }
}