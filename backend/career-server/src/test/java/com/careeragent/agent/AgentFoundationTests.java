package com.careeragent.agent;

import static org.assertj.core.api.Assertions.*;
import static org.mockito.Mockito.*;

import com.careeragent.agent.llm.*;
import com.careeragent.agent.tool.*;
import com.careeragent.agent.tool.impl.*;
import com.careeragent.domain.enums.PendingActionType;
import com.careeragent.exception.*;
import com.careeragent.service.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import org.junit.jupiter.api.Test;

class AgentFoundationTests {
    @Test
    void registryDiscoversToolsAndRejectsUnknownName() {
        AgentTool tool = mock(AgentTool.class);
        when(tool.getName()).thenReturn("demo");
        var registry = new ToolRegistry(List.of(tool));
        assertThat(registry.getTool("demo")).isSameAs(tool);
        assertThatThrownBy(() -> registry.getTool("missing")).isInstanceOf(ToolNotFoundException.class);
    }

    @Test
    void validatorRejectsMissingAndUnknownArguments() {
        AgentTool tool = mock(AgentTool.class);
        when(tool.getInputSchema()).thenReturn(BaseSchemas.object(Map.of("id", BaseSchemas.integer("id")), List.of("id")));
        var validator = new ToolArgumentValidator();
        assertThatThrownBy(() -> validator.validate(tool, Map.of())).isInstanceOf(InvalidToolArgumentsException.class);
        assertThatThrownBy(() -> validator.validate(tool, Map.of("id", 1, "extra", true))).isInstanceOf(InvalidToolArgumentsException.class);
        assertThatCode(() -> validator.validate(tool, Map.of("id", 1))).doesNotThrowAnyException();
    }

    @Test
    void createApplicationIsExplicitWriteConfirmationTool() {
        var tool = new CreateApplicationTool(mock(ApplicationService.class), mock(JobDescriptionService.class));
        assertThat(tool.requiresConfirmation()).isTrue();
        assertThat(tool.getActionType()).isEqualTo(PendingActionType.CREATE_APPLICATION);
    }

    @Test
    void mockLlmCreatesReadToolCall() {
        var adapter = new MockLLMAdapter(new ObjectMapper().findAndRegisterModules());
        var response = adapter.chat(new AgentModelRequest(
                List.of(new AgentModelMessage("USER", "帮我看看岗位 42", Map.of())), List.of()));
        assertThat(response.type()).isEqualTo(AgentModelResponse.Type.TOOL_CALL);
        assertThat(response.toolCalls().get(0).name()).isEqualTo("get_job_detail");
        assertThat(response.toolCalls().get(0).arguments()).containsEntry("jobId", 42L);
    }

    @Test
    void mockLlmCreatesConfirmedWriteCandidateWithoutExecutingBusinessService() {
        var adapter = new MockLLMAdapter(new ObjectMapper().findAndRegisterModules());
        var response = adapter.chat(new AgentModelRequest(
                List.of(new AgentModelMessage("USER", "把岗位 3 用简历版本 7 加入投递", Map.of())), List.of()));
        assertThat(response.toolCalls().get(0).name()).isEqualTo("create_application");
        assertThat(response.toolCalls().get(0).arguments()).containsEntry("resumeVersionId", 7L);
    }

    @Test void mockLlmEmitsRealMessageDeltas(){var adapter=new MockLLMAdapter(new ObjectMapper().findAndRegisterModules());var deltas=new ArrayList<String>();var response=adapter.chatStream(new AgentModelRequest(List.of(new AgentModelMessage("USER","你好",Map.of())),List.of()),deltas::add);assertThat(deltas).hasSizeGreaterThan(1);assertThat(String.join("",deltas)).isEqualTo(response.content());}
}
