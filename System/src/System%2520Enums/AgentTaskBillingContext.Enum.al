// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace System.Agents;

/// <summary>
/// Defines the billing classification for agent tasks.
/// Controls whether consumption for a task is included in or excluded from billing.
/// </summary>
enum 2000000017 "Agent Task Billing Context"
{
    Extensible = false;
    Caption = 'Agent Task Billing Context';

    /// <summary>
    /// Default billing behavior. The task's consumption is billed normally.
    /// </summary>
    value(0; Default)
    {
        Caption = 'Default';
    }

    /// <summary>
    /// The task's consumption is excluded from billing (e.g., during a trial period).
    /// Note that consumption is still reported to the billing pipeline.
    /// </summary>
    value(1; Excluded)
    {
        Caption = 'Excluded';
    }
}
