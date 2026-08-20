package com.careeragent.agent;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.careeragent.agent.llm.*;
import com.careeragent.agent.tool.*;
import com.careeragent.domain.entity.*;
import com.careeragent.domain.enums.*;
import com.careeragent.exception.*;
import com.careeragent.mapper.*;
import com.careeragent.security.CurrentUserProvider;
import com.careeragent.vo.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.time.*;
import java.util.*;
import java.util.function.Consumer;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class AgentOrchestrator {
    static final int MAX_TOOL_STEPS = 8;
    private final LLMAdapter llmAdapter;
    private final ToolRegistry toolRegistry;
    private final ToolArgumentValidator argumentValidator;
    private final AgentConversationMapper conversationMapper;
    private final AgentMessageMapper messageMapper;
    private final ToolExecutionMapper executionMapper;
    private final PendingActionMapper pendingActionMapper;
    private final CurrentUserProvider currentUserProvider;
    private final ObjectMapper objectMapper;
    @Value("${career.agent.pending-action-expiry:30m}") private Duration pendingActionExpiry;

    @Transactional
    public AgentOutcome chat(Long requestedConversationId, String userMessage) {
        var conversation = requestedConversationId == null ? createConversation(userMessage) : ownedConversation(requestedConversationId);
        saveMessage(conversation.getId(), MessageRole.USER, userMessage, Map.of());
        var events = new ArrayList<AgentStreamEvent>();
        events.add(AgentStreamEvent.of("conversation", conversation.getId(), null, null, null, Map.of("conversationId", conversation.getId())));
        return processModel(conversation, events);
    }

    @Transactional
    public AgentOutcome chatStream(Long requestedConversationId,String userMessage,Consumer<AgentStreamEvent> sink){
        var conversation=requestedConversationId==null?createConversation(userMessage):ownedConversation(requestedConversationId);saveMessage(conversation.getId(),MessageRole.USER,userMessage,Map.of());
        var events=new ArrayList<AgentStreamEvent>();var conversationEvent=AgentStreamEvent.of("conversation",conversation.getId(),null,null,null,Map.of("conversationId",conversation.getId()));events.add(conversationEvent);sink.accept(conversationEvent);
        for(int step=0;step<MAX_TOOL_STEPS;step++){
            var response=llmAdapter.chatStream(modelRequest(conversation.getId()),delta->{var event=AgentStreamEvent.of("message_delta",conversation.getId(),null,null,null,delta);events.add(event);sink.accept(event);});
            if(response.type()==AgentModelResponse.Type.MESSAGE)return completeStreamMessage(conversation,response.content(),events,sink);
            for(var call:response.toolCalls()){
                var tool=toolRegistry.getTool(call.name());argumentValidator.validate(tool,call.arguments());var execution=new ToolExecution();execution.setConversationId(conversation.getId());execution.setToolCallId(call.id());execution.setToolName(call.name());execution.setInputData(call.arguments());execution.setStatus(ToolExecutionStatus.PENDING);executionMapper.insert(execution);
                var progress=progressMessage(call.name());if(progress!=null)emit(events,sink,AgentStreamEvent.of("status",conversation.getId(),execution.getId(),null,call.name(),progress));emit(events,sink,AgentStreamEvent.of("tool_start",conversation.getId(),execution.getId(),null,call.name(),call.arguments()));
                if(tool.requiresConfirmation()){var before=events.size();var outcome=awaitConfirmation(conversation,execution,tool,call.arguments(),events);events.subList(before,events.size()).forEach(sink);return outcome;}
                var before=events.size();executeTool(conversation,execution,tool,call.arguments(),events);events.subList(before,events.size()).forEach(sink);
            }
        }
        return completeStreamMessage(conversation,"已达到单次对话的最大工具步骤（"+MAX_TOOL_STEPS+"），为避免无限循环已停止。",events,sink);
    }

    private AgentOutcome processModel(AgentConversation conversation, List<AgentStreamEvent> events) {
        for (int step = 0; step < MAX_TOOL_STEPS; step++) {
            var response = llmAdapter.chat(modelRequest(conversation.getId()));
            if (response.type() == AgentModelResponse.Type.MESSAGE) return completeMessage(conversation, response.content(), events);
            for (var call : response.toolCalls()) {
                var tool = toolRegistry.getTool(call.name());
                argumentValidator.validate(tool, call.arguments());
                var execution = new ToolExecution();
                execution.setConversationId(conversation.getId()); execution.setToolCallId(call.id());
                execution.setToolName(call.name()); execution.setInputData(call.arguments()); execution.setStatus(ToolExecutionStatus.PENDING);
                executionMapper.insert(execution);
                var progress = progressMessage(call.name());
                if (progress != null) events.add(AgentStreamEvent.of("status", conversation.getId(), execution.getId(), null, call.name(), progress));
                events.add(AgentStreamEvent.of("tool_start", conversation.getId(), execution.getId(), null, call.name(), call.arguments()));
                if (tool.requiresConfirmation()) return awaitConfirmation(conversation, execution, tool, call.arguments(), events);
                executeTool(conversation, execution, tool, call.arguments(), events);
            }
        }
        return completeMessage(conversation, "已达到单次对话的最大工具步骤（" + MAX_TOOL_STEPS + "），为避免无限循环已停止。", events);
    }

    private String progressMessage(String toolName) {
        return switch (toolName) {
            case "analyze_job_description" -> "正在分析 JD";
            case "match_resume_to_job" -> "正在匹配简历";
            case "rewrite_experience" -> "正在生成改写建议";
            default -> null;
        };
    }

    private AgentOutcome awaitConfirmation(AgentConversation conversation, ToolExecution execution, AgentTool tool,
                                           Map<String, Object> arguments, List<AgentStreamEvent> events) {
        execution.setStatus(ToolExecutionStatus.WAITING_CONFIRMATION); executionMapper.updateById(execution);
        var action = new PendingAction();
        action.setConversationId(conversation.getId()); action.setToolExecutionId(execution.getId());
        action.setActionType(tool.getActionType()); action.setToolName(tool.getName()); action.setPayload(arguments);
        action.setSummary(tool.confirmationSummary(arguments)); action.setStatus(PendingActionStatus.WAITING);
        action.setExpiresAt(OffsetDateTime.now().plus(pendingActionExpiry)); pendingActionMapper.insert(action);
        conversation.setStatus(ConversationStatus.ACTIVE); conversation.setContextData(Map.of("pendingActionId", action.getId()));
        conversationMapper.updateById(conversation);
        var text = "该操作会写入数据，请确认：" + action.getSummary();
        saveMessage(conversation.getId(), MessageRole.ASSISTANT, text, Map.of("pendingActionId", action.getId()));
        events.add(AgentStreamEvent.of("confirmation_required", conversation.getId(), execution.getId(), action.getId(), tool.getName(), PendingActionVO.from(action)));
        events.add(AgentStreamEvent.of("done", conversation.getId(), execution.getId(), action.getId(), tool.getName(), Map.of("status", "WAITING_CONFIRMATION")));
        return new AgentOutcome(new AgentChatResponse(conversation.getId(), "WAITING_CONFIRMATION", text, PendingActionVO.from(action)), events);
    }

    private ToolResult executeTool(AgentConversation conversation, ToolExecution execution, AgentTool tool,
                                   Map<String, Object> arguments, List<AgentStreamEvent> events) {
        var started = OffsetDateTime.now(); execution.setStartedAt(started); execution.setStatus(ToolExecutionStatus.RUNNING); executionMapper.updateById(execution);
        try {
            var result = tool.execute(new ToolContext(currentUserProvider.getCurrentUserId(), conversation.getId()), arguments);
            execution.setOutputData(objectMapper.convertValue(result, Map.class)); execution.setStatus(result.success() ? ToolExecutionStatus.SUCCESS : ToolExecutionStatus.FAILED);
            if (!result.success()) execution.setErrorMessage(result.message());
            finishExecution(execution, started); saveMessage(conversation.getId(), MessageRole.TOOL, toJson(result), Map.of("toolName", tool.getName(), "toolExecutionId", execution.getId()));
            events.add(AgentStreamEvent.of("tool_result", conversation.getId(), execution.getId(), null, tool.getName(), result));
            return result;
        } catch (BusinessException ex) {
            execution.setStatus(ToolExecutionStatus.FAILED); execution.setErrorMessage(ex.getMessage()); finishExecution(execution, started);
            var result = ToolResult.failure(ex.getMessage(), String.valueOf(ex.getCode()));
            saveMessage(conversation.getId(), MessageRole.TOOL, toJson(result), Map.of("toolName", tool.getName(), "toolExecutionId", execution.getId()));
            events.add(AgentStreamEvent.of("tool_result", conversation.getId(), execution.getId(), null, tool.getName(), result));
            return result;
        } catch (Exception ex) {
            execution.setStatus(ToolExecutionStatus.FAILED); execution.setErrorMessage(ex.getMessage()); finishExecution(execution, started);
            var result = ToolResult.failure(ex.getMessage(), "TOOL_EXECUTION_FAILED");
            saveMessage(conversation.getId(), MessageRole.TOOL, toJson(result), Map.of("toolName", tool.getName(), "toolExecutionId", execution.getId()));
            events.add(AgentStreamEvent.of("tool_result", conversation.getId(), execution.getId(), null, tool.getName(), result));
            return result;
        }
    }

    private void finishExecution(ToolExecution execution, OffsetDateTime started) {
        execution.setFinishedAt(OffsetDateTime.now()); execution.setDurationMs(Duration.between(started, execution.getFinishedAt()).toMillis()); executionMapper.updateById(execution);
    }

    @Transactional
    public AgentOutcome confirm(Long actionId) {
        var action = lockedOwnedAction(actionId);
        ensureWaiting(action);
        var conversation = ownedConversation(action.getConversationId());
        var execution = executionMapper.selectById(action.getToolExecutionId());
        action.setStatus(PendingActionStatus.CONFIRMED); pendingActionMapper.updateById(action);
        var events = new ArrayList<AgentStreamEvent>();
        executeTool(conversation, execution, toolRegistry.getTool(action.getToolName()), action.getPayload(), events);
        action.setStatus(PendingActionStatus.EXECUTED); pendingActionMapper.updateById(action);
        var finalResponse = llmAdapter.chat(modelRequest(conversation.getId()));
        return completeMessage(conversation, finalResponse.content(), events);
    }

    @Transactional
    public AgentOutcome reject(Long actionId) {
        var action = lockedOwnedAction(actionId); ensureWaiting(action);
        var conversation = ownedConversation(action.getConversationId());
        action.setStatus(PendingActionStatus.REJECTED); pendingActionMapper.updateById(action);
        var execution = executionMapper.selectById(action.getToolExecutionId()); execution.setStatus(ToolExecutionStatus.CANCELLED); executionMapper.updateById(execution);
        var text = "已取消操作：" + action.getSummary();
        saveMessage(conversation.getId(), MessageRole.ASSISTANT, text, Map.of("pendingActionId", action.getId()));
        conversation.setStatus(ConversationStatus.COMPLETED); conversation.setContextData(Map.of()); conversationMapper.updateById(conversation);
        var events = List.of(AgentStreamEvent.of("message", conversation.getId(), execution.getId(), action.getId(), action.getToolName(), text),
                AgentStreamEvent.of("done", conversation.getId(), execution.getId(), action.getId(), action.getToolName(), Map.of("status", "REJECTED")));
        return new AgentOutcome(new AgentChatResponse(conversation.getId(), "REJECTED", text, PendingActionVO.from(action)), events);
    }

    public List<AgentConversation> listConversations() {
        return conversationMapper.selectList(new LambdaQueryWrapper<AgentConversation>().eq(AgentConversation::getUserId, currentUserProvider.getCurrentUserId()).orderByDesc(AgentConversation::getUpdatedAt));
    }
    public AgentConversation getConversation(Long id) { return ownedConversation(id); }
    public List<AgentMessage> listMessages(Long id) { ownedConversation(id); return messageMapper.selectList(new LambdaQueryWrapper<AgentMessage>().eq(AgentMessage::getConversationId, id).orderByAsc(AgentMessage::getId)); }
    public List<ToolExecution> listExecutions(Long id) { ownedConversation(id); return executionMapper.selectList(new LambdaQueryWrapper<ToolExecution>().eq(ToolExecution::getConversationId, id).orderByAsc(ToolExecution::getId)); }

    private AgentOutcome completeMessage(AgentConversation conversation, String text, List<AgentStreamEvent> events) {
        saveMessage(conversation.getId(), MessageRole.ASSISTANT, text, Map.of());
        conversation.setStatus(ConversationStatus.COMPLETED); conversation.setContextData(Map.of()); conversationMapper.updateById(conversation);
        events.add(AgentStreamEvent.of("message_delta", conversation.getId(), null, null, null, text));
        events.add(AgentStreamEvent.of("message", conversation.getId(), null, null, null, text));
        events.add(AgentStreamEvent.of("done", conversation.getId(), null, null, null, Map.of("status", "COMPLETED")));
        return new AgentOutcome(new AgentChatResponse(conversation.getId(), "COMPLETED", text, null), events);
    }
    private AgentOutcome completeStreamMessage(AgentConversation conversation,String text,List<AgentStreamEvent> events,Consumer<AgentStreamEvent> sink){saveMessage(conversation.getId(),MessageRole.ASSISTANT,text,Map.of());conversation.setStatus(ConversationStatus.COMPLETED);conversation.setContextData(Map.of());conversationMapper.updateById(conversation);var message=AgentStreamEvent.of("message",conversation.getId(),null,null,null,text);var done=AgentStreamEvent.of("done",conversation.getId(),null,null,null,Map.of("status","COMPLETED"));emit(events,sink,message);emit(events,sink,done);return new AgentOutcome(new AgentChatResponse(conversation.getId(),"COMPLETED",text,null),events);}
    private void emit(List<AgentStreamEvent> events,Consumer<AgentStreamEvent> sink,AgentStreamEvent event){events.add(event);sink.accept(event);}

    private AgentConversation createConversation(String message) {
        var entity = new AgentConversation(); entity.setUserId(currentUserProvider.getCurrentUserId());
        entity.setTitle(message.substring(0, Math.min(40, message.length()))); entity.setStatus(ConversationStatus.ACTIVE); entity.setContextData(Map.of());
        conversationMapper.insert(entity); return entity;
    }
    private AgentConversation ownedConversation(Long id) {
        var entity = conversationMapper.selectById(id);
        if (entity == null || !Objects.equals(entity.getUserId(), currentUserProvider.getCurrentUserId())) throw new ResourceNotFoundException("Agent conversation", id);
        return entity;
    }
    private PendingAction lockedOwnedAction(Long id) {
        var action = pendingActionMapper.selectByIdForUpdate(id);
        if (action == null) throw new PendingActionNotFoundException(id);
        ownedConversation(action.getConversationId()); return action;
    }
    private void ensureWaiting(PendingAction action) {
        if (action.getStatus() != PendingActionStatus.WAITING) throw new PendingActionAlreadyProcessedException(action.getId(), action.getStatus().name());
        if (action.getExpiresAt().isBefore(OffsetDateTime.now())) {
            action.setStatus(PendingActionStatus.EXPIRED); pendingActionMapper.updateById(action);
            var execution = executionMapper.selectById(action.getToolExecutionId()); execution.setStatus(ToolExecutionStatus.CANCELLED); executionMapper.updateById(execution);
            throw new PendingActionAlreadyProcessedException(action.getId(), "EXPIRED");
        }
    }
    private void saveMessage(Long conversationId, MessageRole role, String content, Map<String, Object> metadata) {
        var message = new AgentMessage(); message.setConversationId(conversationId); message.setRole(role); message.setContent(content); message.setMetadata(metadata); messageMapper.insert(message);
    }
    private AgentModelRequest modelRequest(Long conversationId) {
        var messages = messageMapper.selectList(new LambdaQueryWrapper<AgentMessage>().eq(AgentMessage::getConversationId, conversationId).orderByAsc(AgentMessage::getId)).stream()
                .map(m -> new AgentModelMessage(m.getRole().name(), m.getContent(), m.getMetadata())).toList();
        var tools = toolRegistry.getAllTools().stream().map(t -> new ToolDefinition(t.getName(), t.getDescription(), t.getInputSchema())).toList();
        return new AgentModelRequest(messages, tools);
    }
    private String toJson(Object value) {
        try { return objectMapper.writeValueAsString(value); } catch (JsonProcessingException e) { throw new ToolExecutionFailedException("Tool output serialization failed"); }
    }
}
