// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

namespace System.Agents.TaskPane;

using System.Agents;

codeunit 2000000027 "Task Pane"
{
    /// <summary>
    /// Show the specified agent in the task pane.
    /// </summary>
    /// <param name="Agent">The agent record.</param>
    [Scope('OnPrem')]
    procedure ShowAgent(Agent: Record Agent)
    begin
        ShowAgentByUserSecurityID(Agent."User Security ID");
    end;

    /// <summary>
    /// Show the agent with the specified agent metadata ID in the task pane.
    /// </summary>
    /// <param name="AgentMetadataID">The agent metadata ID.</param>
    [Scope('OnPrem')]
    procedure ShowAgent(AgentMetadataID: Enum "Agent Metadata Provider")
    begin
        ShowAgentByMetadataID(AgentMetadataID);
    end;

    /// <summary>
    /// Show the agent with the specified agent user security ID in the task pane.
    /// </summary>
    /// <param name="AgentUserID">The agent user security ID.</param>
    [Scope('OnPrem')]
    procedure ShowAgent(AgentUserSecurityID: Guid)
    begin
        ShowAgentByUserSecurityID(AgentUserSecurityID);
    end;

    /// <summary>
    /// Show the specified agent task in the task pane.
    /// </summary>
    /// <param name="AgentTask">The agent task record.</param>
    [Scope('OnPrem')]
    procedure ShowTask(AgentTask: Record "Agent Task")
    begin
        ShowTaskByID(AgentTask."Agent User Security ID", AgentTask.ID);
    end;

    /// <summary>
    /// Show the specified agent task in the task pane.
    /// </summary>
    /// <param name="TaskID">The agent task ID.</param>
    [Scope('OnPrem')]
    procedure ShowTask(TaskID: BigInteger)
    var
        AgentTask: Record "Agent Task";
        AgentUserSecurityID: Guid;
    begin
        if AgentTask.Get(TaskID) then
            AgentUserSecurityID := AgentTask."Agent User Security ID";

        ShowTaskByID(AgentUserSecurityID, TaskID)
    end;

    /// <summary>
    /// Review the specified agent task in the task pane.
    /// </summary>
    /// <param name="AgentTask">The agent task record.</param>
    [Scope('OnPrem')]
    procedure ReviewTask(AgentTask: Record "Agent Task")
    begin
        ReviewTaskByID(AgentTask."Agent User Security ID", AgentTask.ID);
    end;

    /// <summary>
    /// Review the specified agent task in the task pane.
    /// </summary>
    /// <param name="TaskID">The agent task ID.</param>
    [Scope('OnPrem')]
    procedure ReviewTask(TaskID: BigInteger)
    var
        AgentTask: Record "Agent Task";
        AgentUserSecurityID: Guid;
    begin
        if AgentTask.Get(TaskID) then
            AgentUserSecurityID := AgentTask."Agent User Security ID";

        ReviewTaskByID(AgentUserSecurityID, TaskID)
    end;

    [Native]
    local procedure ShowAgentByMetadataID(AgentMetadataID: Enum "Agent Metadata Provider")
    begin
    end;

    [Native]
    local procedure ShowAgentByUserSecurityID(AgentUserSecurityID: Guid)
    begin
    end;

    [Native]
    local procedure ShowTaskByID(AgentUserSecurityID: Guid; TaskID: BigInteger)
    begin
    end;

    [Native]
    local procedure ReviewTaskByID(AgentUserSecurityID: Guid; TaskID: BigInteger)
    begin
    end;
}
