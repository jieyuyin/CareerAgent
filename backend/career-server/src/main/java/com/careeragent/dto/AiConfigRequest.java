package com.careeragent.dto;
import jakarta.validation.constraints.*;
public record AiConfigRequest(@NotBlank @Pattern(regexp="mock|openai-compatible") String provider,
 @NotBlank @Size(max=200) String model, @Size(max=1000) String baseUrl, @Size(max=2000) String apiKey) {}
