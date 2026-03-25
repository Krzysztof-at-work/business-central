// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace System.Agents;

enum 2000000014 "Agent Publisher Type"
{
    Extensible = false;
    Caption = 'Agent Publisher Type';
    Scope = OnPrem;

    /// <summary>
    /// An agent provided by a 3rd party publisher.
    /// </summary>
    value(0; "Third Party")
    {
        Caption = 'Third Party';
    }
    /// <summary>
    /// An agent provided by Microsoft.
    /// </summary>
    value(1; "First Party")
    {
        Caption = 'First Party';
    }
    /// <summary>
    /// An agent that was created without involvement of an AL extension publisher.
    /// </summary>
    value(2; User)
    {
        Caption = 'User';
    }
}