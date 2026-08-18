package com.careeragent.agent.llm;

import com.careeragent.exception.LLMProviderException;
import com.fasterxml.jackson.databind.ObjectMapper;

public abstract class AbstractJsonStructuredOutputAdapter implements LLMAdapter {
    private static final int MAX_ATTEMPTS = 3;
    protected final ObjectMapper objectMapper;

    protected AbstractJsonStructuredOutputAdapter(ObjectMapper objectMapper) { this.objectMapper = objectMapper; }

    @Override
    public <T> T structuredOutput(String prompt, Object input, Class<T> responseType) {
        Exception last = null;
        for (int attempt = 1; attempt <= MAX_ATTEMPTS; attempt++) {
            try {
                var json = generateStructuredJson(prompt, input, responseType, attempt);
                return objectMapper.readValue(json, responseType);
            } catch (Exception ex) { last = ex; }
        }
        throw new LLMProviderException("Structured output parsing failed after 3 attempts: " + last.getMessage());
    }

    protected abstract String generateStructuredJson(String prompt, Object input, Class<?> responseType, int attempt) throws Exception;
}
