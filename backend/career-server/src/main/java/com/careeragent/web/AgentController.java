package com.careeragent.web;

import com.careeragent.agent.AgentOrchestrator;
import com.careeragent.dto.AgentChatRequest;
import com.careeragent.vo.AgentChatResponse;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

@RestController
@RequestMapping("/api/agent")
@RequiredArgsConstructor
public class AgentController {
    private final AgentOrchestrator orchestrator;

    @PostMapping("/chat")
    public ApiResponse<AgentChatResponse> chat(@Valid @RequestBody AgentChatRequest request) {
        return ApiResponse.success(orchestrator.chat(request.conversationId(), request.message()).response());
    }

    @PostMapping(value = "/chat/stream", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public SseEmitter stream(@Valid @RequestBody AgentChatRequest request) {
        var emitter = new SseEmitter(60_000L);
        try {
            var outcome = orchestrator.chat(request.conversationId(), request.message());
            for (var event : outcome.events()) emitter.send(SseEmitter.event().name(event.type()).data(event));
            emitter.complete();
        } catch (Exception ex) {
            try { emitter.send(SseEmitter.event().name("error").data(java.util.Map.of("message", ex.getMessage()))); }
            catch (Exception ignored) { }
            emitter.complete();
        }
        return emitter;
    }

    @PostMapping("/actions/{id}/confirm")
    public ApiResponse<AgentChatResponse> confirm(@PathVariable Long id) {
        return ApiResponse.success(orchestrator.confirm(id).response());
    }

    @PostMapping("/actions/{id}/reject")
    public ApiResponse<AgentChatResponse> reject(@PathVariable Long id) {
        return ApiResponse.success(orchestrator.reject(id).response());
    }

    @GetMapping("/conversations") public ApiResponse<?> conversations() { return ApiResponse.success(orchestrator.listConversations()); }
    @GetMapping("/conversations/{id}") public ApiResponse<?> conversation(@PathVariable Long id) { return ApiResponse.success(orchestrator.getConversation(id)); }
    @GetMapping("/conversations/{id}/messages") public ApiResponse<?> messages(@PathVariable Long id) { return ApiResponse.success(orchestrator.listMessages(id)); }
    @GetMapping("/conversations/{id}/tool-executions") public ApiResponse<?> executions(@PathVariable Long id) { return ApiResponse.success(orchestrator.listExecutions(id)); }
}
