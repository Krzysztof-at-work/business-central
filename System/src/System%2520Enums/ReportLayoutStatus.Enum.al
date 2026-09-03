// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace System.Reflection;

/// <summary>
/// Defines Report layout status
/// </summary>
/// <remarks>
/// </remarks>
enum 2000000015 "Report Layout Status"
{
    Extensible = true;
    Caption = 'Report Layout Status';
    Scope = Cloud;

    /// <summary>
    /// Layout is approved and available to users.
    /// </summary>
    value(0; Approved)
    {
        Caption = 'Approved';
    }

    /// <summary>
    /// Layout is under development and not available to users.
    /// </summary>
    value(1; Draft)
    {
        Caption = 'Draft';
    }

    /// <summary>
    /// Layout is awaiting approval
    /// </summary>
    value(2; "Pending Approval")
    {
        Caption = 'Pending Approval';
    }

    /// <summary>
    /// Layout is phased out and no longer available.
    /// </summary>
    value(3; Retired)
    {
        Caption = 'Retired';
    }
}