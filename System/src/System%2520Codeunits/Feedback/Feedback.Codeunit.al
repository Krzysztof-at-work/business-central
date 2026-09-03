// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

namespace System.Feedback;

/// <summary>
/// Provides an API for requesting user feedback to be collected in the client
/// through the OCV platform.
/// </summary>
codeunit 2000000021 Feedback
{
    Access = Internal;
    InherentEntitlements = X;
    InherentPermissions = X;

    /// <summary>
    /// Sets a custom question to be presented to the user when requesting feedback.
    /// </summary>
    /// <param name="Question">The custom question text to be displayed to the user.</param>
    /// <param name="QuestionDisplay">The display text for the question. Translatable string.</param>
    /// <param name="QuestionType">The type of question.</param>
    /// <param name="RequiredBehavior">An dictionary of the enum values -> boolean-like value (true/false/1/0), indicating behavior for requiring answers.</param>
    /// <param name="AnswerOptions">A dictionary of answer options where the key is the option value and the value is the display text.
    /// Only applicable for Dropdown, MultiSelect, SingleSelect, and SingleSelectHorizontal question types.
    /// </param>
    [Native]
    procedure SetCustomQuestion(Question: Text; QuestionDisplay: Text; QuestionType: Enum FeedbackQuestionType; RequiredBehavior: Dictionary of [Enum FeedbackRequiredBehavior, Text]; AnswerOptions: Dictionary of [Text, Text])
    begin
    end;

    /// <summary>
    /// Clears any previously set custom question.
    /// </summary>
    [Native]
    procedure ClearCustomQuestion()
    begin
    end;

    /// <summary>
    /// Requests general feedback for a feature, optionally specifying if it is a Copilot feature and its area.
    /// </summary>
    /// <param name="FeatureName">The name of the feature for which feedback is requested. This is the ID of the feature area on OCV.</param>
    /// <param name="FeatureAreaDisplayName">The display name of the feature area. Translatable string. If not provided, FeatureName is used.</param>
    /// <param name="FeatureArea">The area or sub-area of the feature.</param>
    /// <param name="ContextFiles">Additional context data as key-value pairs of filename and base64 file to provide more information about the feedback request. Must contain the file extension in the name.</param>
    /// <param name="ContextProperties">Additional context data as key-value pairs to provide additional information. Pass flag IsAIFeature if giving feedback for AI.</param>
    [Native]
    procedure RequestFeedback(FeatureName: Text; FeatureArea: Text; FeatureAreaDisplayName: Text; ContextFiles: Dictionary of [Text, Text]; ContextProperties: Dictionary of [Text, Text])
    begin
    end;

    /// <summary>
    /// Requests a 'like' (positive) feedback for a feature, optionally specifying if it is a Copilot feature and its area.
    /// </summary>
    /// <param name="FeatureName">The name of the feature for which like feedback is requested.</param>
    /// <param name="FeatureArea">The area or sub-area of the feature.</param>
    /// <param name="FeatureAreaDisplayName">The display name of the feature area. Translatable string. If not provided, FeatureName is used.</param>
    /// <param name="ContextFiles">Additional context data as key-value pairs of filename and base64 file to provide more information about the feedback request. Must contain the file extension in the name.</param>
    /// <param name="ContextProperties">Additional context data as key-value pairs to provide additional information. Pass flag IsAIFeature if giving feedback for AI.</param>
    [Native]
    procedure RequestLikeFeedback(FeatureName: Text; FeatureArea: Text; FeatureAreaDisplayName: Text; ContextFiles: Dictionary of [Text, Text]; ContextProperties: Dictionary of [Text, Text])
    begin
    end;

    /// <summary>
    /// Requests a 'dislike' (negative) feedback for a feature, optionally specifying if it is a Copilot feature and its area.
    /// </summary>
    /// <param name="FeatureName">The name of the feature for which dislike feedback is requested.</param>
    /// <param name="FeatureArea">The area or sub-area of the feature.</param>
    /// <param name="FeatureAreaDisplayName">The display name of the feature area. Translatable string. If not provided, FeatureName is used.</param>
    /// <param name="ContextFiles">Additional context data as key-value pairs of filename and base64 file to provide more information about the feedback request. Must contain the file extension in the name.</param>
    /// <param name="ContextProperties">Additional context data as key-value pairs to provide additional information. Pass flag IsAIFeature if giving feedback for AI.</param>
    [Native]
    procedure RequestDislikeFeedback(FeatureName: Text; FeatureArea: Text; FeatureAreaDisplayName: Text; ContextFiles: Dictionary of [Text, Text]; ContextProperties: Dictionary of [Text, Text])
    begin
    end;

    /// <summary>
    /// Starts or stops a survey timer activity. This is used to start a timer to count up user usage
    /// times, which can then trigger a survey prompt after a certain threshold is reached.
    /// </summary>
    /// <param name="ActivityName">The name of the activity for which the timer is started or stopped.</param>
    /// <param name="Start">If true, starts the timer; if false, stops the timer.</param>
    [Native]
    procedure SurveyTimerActivity(ActivityName: Text; Start: Boolean)
    begin
    end;

    /// <summary>
    /// Sends a one-time trigger event based on a specific activity name.
    /// The event could be, for example, a user clicking a button
    /// </summary>
    /// <param name="ActivityName">The name of the activity that triggers the survey.</param>
    [Native]
    procedure SurveyTriggerActivity(ActivityName: Text)
    begin
    end;
}