package com.careeragent.agent.llm;

import java.util.function.Consumer;

public interface LLMAdapter {
    AgentModelResponse chat(AgentModelRequest request);
    default AgentModelResponse chatStream(AgentModelRequest request, Consumer<String> onDelta) {
        var response=chat(request);if(response.type()==AgentModelResponse.Type.MESSAGE&&response.content()!=null)onDelta.accept(response.content());return response;
    }
    <T> T structuredOutput(String prompt, Object input, Class<T> responseType);
    default <T> T structuredOutput(String prompt, Object input, Class<T> responseType, String modelOverride) {
        return structuredOutput(prompt, input, responseType);
    }
    default String textStream(String prompt,Object input,String modelOverride,Consumer<String> onDelta){throw new UnsupportedOperationException("Streaming is not supported");}
}
