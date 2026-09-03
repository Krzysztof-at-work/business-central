// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

namespace System.MCP;

#pragma warning disable AS0018, AS0023, AS0026
/// <summary>
/// Provides functionality for managing MCP configurations.
/// </summary>
codeunit 2000000023 "MCP Utilities"
{
    Access = Internal;

    /// <summary>
    /// Get a dictionary of potential parent MCP tools for the provided list of page IDs with their API versions.
    /// Note: This assumes unique page IDs across all API versions in the MCP configuration tool.
    /// Multiple pages with the same ID but different API versions are not supported.
    /// </summary>
    /// <param name="PageIdVersions">Dictionary of page object ID and API version.</param>
    /// <returns>Dictionary mapping each (page ID, version) tuple to its list of potential parent MCP tool page IDs.</returns>
    [Native]
    procedure GetParentMCPTools(PageIdVersions: Dictionary of [Integer, Text]): Dictionary of [Integer, List of [Integer]]
    begin
    end;

    /// <summary>
    /// Get a dictionary of system tools available in dynamic mode.
    /// </summary>
    /// <returns>Dictionary mapping each system tool name to their description</returns>
    [Native]
    procedure GetSystemToolsInDynamicMode(): Dictionary of [Text, Text]
    begin
    end;
}
#pragma warning restore AS0018, AS0023, AS0026