// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace System.Agents;

/// <summary>
/// Virtual table that stores data associated with agent models.
/// Exposed to cloud, but read-only for any apps.
/// </summary>
/// <remarks>
/// This table provides access to available agent models that can be used for agent tasks execution.
/// </remarks>
table 2000000299 "Agent Model"
{
    Caption = 'Agent Model';
    DataPerCompany = false;
    ReplicateData = false;
    InherentPermissions = RX;
    InherentEntitlements = RX;
    Scope = Cloud;

    fields
    {
        /// <summary>
        /// The unique identifier of the agent model.
        /// </summary>
        field(1; "Model ID"; Code[30])
        {
            Caption = 'Model ID';
            Editable = false;
            ToolTip = 'Specifies the unique identifier of the agent model.';
        }
        /// <summary>
        /// The model name.
        /// </summary>
        field(2; "Model Name"; Text[70])
        {
            Caption = 'Model Name';
            Editable = false;
            Tooltip = 'Specifies the name of the agent model.';
        }
        /// <summary>
        /// The indication if model is Default.
        /// </summary>
        field(3; "Is Default"; Boolean)
        {
            Caption = 'Is Default';
            Editable = false;
            Tooltip = 'Specifies if agent model is Default model.';
        }
        /// <summary>
        /// The availability status of the model.
        /// </summary>
#pragma warning disable AS0005
        field(4; Availability; Option)
        {
            Caption = 'Availability';
            Editable = false;
            Tooltip = 'Specifies the availability status of the agent model.';
            OptionCaption = 'Preview,Available,Obsolete,Retired';
            OptionMembers = Preview,Available,Obsolete,Retired;
        }
#pragma warning restore AS0005
        /// <summary>
        /// The retirement date of the model.
        /// </summary>
#pragma warning disable AS0005
        field(5; "Retirement Date"; Date)
        {
            Caption = 'Retirement Date';
            Editable = false;
            Tooltip = 'Specifies the retirement date of the agent model.';
        }
#pragma warning restore AS0005
    }

    keys
    {
        key(PK; "Model ID")
        {
        }
    }
}