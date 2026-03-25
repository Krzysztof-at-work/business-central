// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace System.Agents.Internal;

using System.Security.AccessControl;

/// <summary>
/// Stores troubleshooting information for agent tasks, providing debugging and diagnostic data for agent execution.
/// </summary>
/// <remarks>
/// This table implements the troubleshooting system for agent tasks, storing diagnostic information that helps
/// with debugging and analyzing agent task execution issues.
/// </remarks>
table 2000000298 "Agent Troubleshoot Info Data"
{
    Caption = 'Agent Task Troubleshooting Info Data';
    DataPerCompany = false;
    ReplicateData = false;
    Scope = OnPrem;
    Access = Internal;

    fields
    {
        /// <summary>
        /// Unique identifier for the troubleshooting info entry.
        /// </summary>
        field(1; ID; BigInteger)
        {
            Caption = 'ID';
            AutoIncrement = true;
        }

        /// <summary>
        /// Identifier of the agent task this troubleshooting info belongs to.
        /// </summary>
        field(2; "Task ID"; BigInteger)
        {
            Caption = 'Task ID';
            TableRelation = "Agent Task Data".ID;
        }

        /// <summary>
        /// Identifier for the memory entry ID associated with this troubleshooting info.
        /// </summary>
        field(3; "Memory Entry ID"; Integer)
        {
            Caption = 'Memory Entry ID';
            TableRelation = "Agent Task Memory Entry Data".ID;
        }

        /// <summary>
        /// A blob containing detailed troubleshooting information.
        /// It is expected to contain a JSON structure with the following data:
        /// 1. Page snapshot: schema and data on the page
        /// 2. Agent tools available on the page
        /// 3. Memorized data
        /// 4. Page stack
        /// 5. Agent settings
        /// </summary>
        field(4; "Troubleshooting Info"; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'Troubleshooting Info';
        }

        field(5; "Agent User ID"; Guid)
        {
            Caption = 'Agent User ID';
            // Using user here as it is immutable.
            TableRelation = User."User Security ID";
        }
    }

    keys
    {
        key(PK; ID)
        {
            Clustered = true;
        }

        key(Relations; "Task ID", "Memory Entry ID")
        {
        }

        key(RetentionKey; SystemCreatedAt, "Agent User ID")
        {
        }
    }
}