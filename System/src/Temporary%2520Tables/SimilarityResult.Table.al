// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace System.Search;

/// <summary>
/// Temporary table that holds search results from semantic searches across Business Central.
/// Used to present search findings with similarity scoring and record identification.
/// </summary>
table 2000000296 "Similarity Result"
{
    TableType = Temporary;
    InherentPermissions = RIMDX;
    InherentEntitlements = RIMDX;
    Scope = OnPrem;

    fields
    {
        /// <summary>
        /// Sequential number for ordering and identifying search result entries.
        /// </summary>
        field(1; "No."; Integer)
        {
        }

        /// <summary>
        /// Unique system identifier for the search result entry.
        /// </summary>
        field(2; "System ID"; Guid)
        {
        }

        /// <summary>
        /// Similarity score indicating how closely the found result matches the search criteria.
        /// Higher values indicate better matches.
        /// </summary>
        field(3; Similarity; Decimal)
        {
        }

    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }
}