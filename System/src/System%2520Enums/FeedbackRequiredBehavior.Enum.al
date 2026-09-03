// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace System.Feedback;

enum 2000000012 FeedbackRequiredBehavior
{
    Extensible = false;
    Caption = 'Feedback Required Behavior';

    /// <summary>
    /// Main question is not required.
    /// </summary>
    value(0; QuestionNotRequired)
    {
        Caption = 'Question Not Required';
    }

    /// <summary>
    /// Comment below question is not required.
    /// </summary>
    value(1; "CommentNotRequired")
    {
        Caption = 'Comment Not Required';
    }

    /// <summary>
    /// Comment below question is required if the last option is selected.
    /// </summary>
    value(2; "CommentRequiredLastOption")
    {
        Caption = 'Comment Required Last Option';
    }
}