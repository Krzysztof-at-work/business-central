// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace System.Feedback;

enum 2000000013 FeedbackQuestionType
{
    Extensible = false;
    Caption = 'Feedback Question Type';

    /// <summary>
    /// Dropdown question type.
    /// </summary>
    value(0; Dropdown)
    {
        Caption = 'Dropdown';
    }

    /// <summary>
    /// Text question type.
    /// </summary>
    value(1; Text)
    {
        Caption = 'Text';
    }

    /// <summary>
    /// Rating question type.
    /// </summary>
    value(2; Rating)
    {
        Caption = 'Rating';
    }

    /// <summary>
    /// MultiSelect question type.
    /// </summary>
    value(3; MultiSelect)
    {
        Caption = 'MultiSelect';
    }

    /// <summary>
    /// SingleSelect question type.
    /// </summary>
    value(4; SingleSelect)
    {
        Caption = 'SingleSelect';
    }

    /// <summary>
    /// SingleSelectHorizontal question type.
    /// </summary>
    value(5; SingleSelectHorizontal)
    {
        Caption = 'SingleSelectHorizontal';
    }
}