package com.careeragent.agent.llm;

public interface LLMAdapter {
    AgentModelResponse chat(AgentModelRequest request);
    <T> T structuredOutput(String prompt, Object input, Class<T> responseType);
    default <T> T structuredOutput(String prompt, Object input, Class<T> responseType, String modelOverride) {
        return structuredOutput(prompt, input, responseType);
    }
}
