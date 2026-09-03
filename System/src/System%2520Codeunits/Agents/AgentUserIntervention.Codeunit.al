// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

namespace System.Agents;

/// <summary>
/// Provides functionality for creating and managing user interventions in agent tasks.
/// This codeunit handles the creation of user intervention responses to agent requests,
/// including processing user input and suggestion selections.
/// </summary>
codeunit 2000000019 "Agent User Intervention"
{
    InherentEntitlements = X;
    InherentPermissions = X;

    /// <summary>
    /// Get the user intervention details for the specified log entry.
    /// </summary>
    /// <param name="UserInterventionRequestEntry">The agent task log entry.</param>
    /// <param name="TempUserInterventionRequestDetails">The user interevention request details.</param>
    /// <param name="TempUserInterventionAnnotations">The annotations on the user intervention request.</param>
    [Scope('OnPrem')]
    procedure GetUserInterventionRequestDetails(
        UserInterventionRequestEntry: Record "Agent Task Log Entry";
        var TempUserInterventionRequestDetails: Record "Agent User Int Request Details" temporary;
        var TempUserInterventionAnnotations: Record "Agent Annotation" temporary)
    var
        TempUserInterventionSuggestions: Record "Agent Task User Int Suggestion" temporary;
    begin
        GetUserInterventionRequestDetails(UserInterventionRequestEntry, TempUserInterventionRequestDetails, TempUserInterventionAnnotations, TempUserInterventionSuggestions);
    end;

    /// <summary>
    /// Get the user intervention details for the specified log entry.
    /// </summary>
    /// <param name="UserInterventionRequestEntry">The agent task log entry.</param>
    /// <param name="TempUserInterventionRequestDetails">The user interevention request details.</param>
    /// <param name="TempUserInterventionAnnotations">The annotations on the user intervention request.</param>
    /// <param name="TempUserInterventionSuggestions">The suggestions available for the user intervention request.</param>
    [Scope('OnPrem')]
    [Native]
    procedure GetUserInterventionRequestDetails(
        UserInterventionRequestEntry: Record "Agent Task Log Entry";
        var TempUserInterventionRequestDetails: Record "Agent User Int Request Details" temporary;
        var TempUserInterventionAnnotations: Record "Agent Annotation" temporary;
        var TempUserInterventionSuggestions: Record "Agent Task User Int Suggestion" temporary)
    begin
    end;

    /// <summary>
    /// Creates a user intervention response for an agent task log entry without additional input.
    /// </summary>
    /// <param name="UserInterventionRequestEntry">The agent task log entry that requested user intervention.</param>
    [Scope('OnPrem')]
    procedure CreateUserIntervention(UserInterventionRequestEntry: Record "Agent Task Log Entry")
    begin
        CreateUserIntervention(UserInterventionRequestEntry, '');
    end;

    /// <summary>
    /// Creates a user intervention response with custom user input text.
    /// </summary>
    /// <param name="UserInterventionRequestEntry">The agent task log entry that requested user intervention.</param>
    /// <param name="UserInput">Additional text input provided by the user as part of the intervention response.</param>
    [Scope('OnPrem')]
    procedure CreateUserIntervention(UserInterventionRequestEntry: Record "Agent Task Log Entry"; UserInput: Text)
    var
        AgentTask: Record "Agent Task";
    begin
        AgentTask.Get(UserInterventionRequestEntry."Task ID");
        CreateUserInterventionFromUserInputInternal(AgentTask."Agent User Security ID", AgentTask.ID, UserInterventionRequestEntry.ID, UserInput);
    end;

    /// <summary>
    /// Creates a user intervention response with both user input and a suggestion ID provided as text.
    /// </summary>
    /// <param name="UserInterventionRequestEntry">The agent task log entry that requested user intervention.</param>
    /// <param name="UserInput">Additional text input provided by the user as part of the intervention response.</param>
    /// <param name="SelectedSuggestionCode">The suggestion ID as text that will be converted to integer. If invalid, logs an error and proceeds without suggestion selection.</param>
    [Scope('OnPrem')]
    procedure CreateUserInterventionFromSuggestionCode(UserInterventionRequestEntry: Record "Agent Task Log Entry"; SelectedSuggestionCode: Code[20])
    var
        AgentTask: Record "Agent Task";
    begin
        AgentTask.Get(UserInterventionRequestEntry."Task ID");
        CreateUserInterventionFromSuggestionCodeInternal(AgentTask."Agent User Security ID", AgentTask.ID, UserInterventionRequestEntry.ID, '', SelectedSuggestionCode);
    end;

    /// <summary>
    /// Creates a user intervention response with both user input and a suggestion ID provided as text.
    /// </summary>
    /// <param name="UserInterventionRequestEntry">The agent task log entry that requested user intervention.</param>
    /// <param name="UserInput">Additional text input provided by the user as part of the intervention response.</param>
    /// <param name="SelectedSuggestionId">The suggestion ID as text that will be converted to integer. If invalid, logs an error and proceeds without suggestion selection.</param>
    [Scope('OnPrem')]
    internal procedure CreateUserInterventionFromSuggestionId(UserInterventionRequestEntry: Record "Agent Task Log Entry"; UserInput: Text; SelectedSuggestionId: Text)
    var
        SelectedSuggestionIdInt: Integer;
    begin
        if SelectedSuggestionId <> '' then
            if Evaluate(SelectedSuggestionIdInt, SelectedSuggestionId) then begin
                CreateUserIntervention(UserInterventionRequestEntry, UserInput, SelectedSuggestionIdInt);
                exit;
            end
            else
                Session.LogMessage('0000PKA', StrSubstNo(InvalidSelectedSuggestionIdErr, SelectedSuggestionId), Verbosity::Error, DataClassification::SystemMetadata, TelemetryScope::ExtensionPublisher, 'Category', CategoryTok);

        CreateUserIntervention(UserInterventionRequestEntry, UserInput);
    end;

    /// <summary>
    /// Creates a user intervention response with both user input and a selected suggestion ID.
    /// </summary>
    /// <remarks>
    /// This method should not be used anymore, and will be marked as internal so that only the timeline uses it.
    /// </remarks>
    /// <param name="UserInterventionRequestEntry">The agent task log entry that requested user intervention.</param>
    /// <param name="UserInput">Additional text input provided by the user as part of the intervention response.</param>
    /// <param name="SelectedSuggestionId">The integer ID of the suggestion selected by the user from the available options.</param>
    [Scope('OnPrem')]
    procedure CreateUserIntervention(UserInterventionRequestEntry: Record "Agent Task Log Entry"; UserInput: Text; SelectedSuggestionId: Integer)
    var
        AgentTask: Record "Agent Task";
    begin
        AgentTask.Get(UserInterventionRequestEntry."Task ID");
        CreateUserInterventionFromSuggestionIdInternal(AgentTask."Agent User Security ID", AgentTask.ID, UserInterventionRequestEntry.ID, UserInput, SelectedSuggestionId);
    end;

    [Native]
    [Scope('OnPrem')]
    local procedure CreateUserInterventionFromUserInputInternal(AgentUserSecurityId: Guid; AgentTaskId: BigInteger; UserInterventionRequestEntryId: Integer; UserInput: Text)
    begin
    end;

    [Native]
    [Scope('OnPrem')]
    local procedure CreateUserInterventionFromSuggestionIdInternal(AgentUserSecurityId: Guid; AgentTaskId: BigInteger; UserInterventionRequestEntryId: Integer; UserInput: Text; SelectedSuggestionId: Integer)
    begin
    end;

    [Native]
    [Scope('OnPrem')]
    local procedure CreateUserInterventionFromSuggestionCodeInternal(AgentUserSecurityId: Guid; AgentTaskId: BigInteger; UserInterventionRequestEntryId: Integer; UserInput: Text; SelectedSuggestionCode: Code[20])
    begin
    end;

    var
        InvalidSelectedSuggestionIdErr: Label 'Invalid SelectedSuggestionId: %1', Comment = '%1 - SelectedSuggestionId', Locked = true;
        CategoryTok: Label 'Agents', Locked = true;
}