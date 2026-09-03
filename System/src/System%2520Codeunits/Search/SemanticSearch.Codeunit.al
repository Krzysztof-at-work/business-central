// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace System.Search;

/// <summary>
/// Provides functionality to perform semantic searches on both metadata objects and data records,
/// retrieving ranked results based on similarity scoring.
/// </summary>
codeunit 2000000025 "Semantic Search"
{
    /// <summary>
    /// Sets the maximum number of results to return from a search.
    /// </summary>
    /// <param name="MaxResults">The maximum number of results to return.</param>
    [Native]
    [Scope('OnPrem')]
    procedure SetMaxResults(MaxResults: Integer)
    begin
    end;

    /// <summary>
    /// Sets the target to search. Any filters set on the record will be applied to the search.
    /// </summary>
    /// <param name="Record">The RecordRef to search</param>
    [Native]
    [Scope('OnPrem')]
    procedure SetSearchTarget(Record: RecordRef)
    begin
    end;

    /// <summary>
    /// Performs a semantic (similarity) search for the specified text on a specified list of fields and populates the provided result table with the search results.
    /// </summary>
    /// <param name="SearchText">The text to search for.</param>
    /// <param name="FieldIds">The list of field IDs to search within.</param>
    /// <param name="ResultTable">The table to populate with the search results.</param>
    /// <returns>True if the search was successful; otherwise, false.</returns>
    [Native]
    [Scope('OnPrem')]
    procedure FindSimilarByField(SearchText: Text; FieldIds: List of [Integer]; var ResultTable: Record "Similarity Result"): Boolean
    begin
    end;
}