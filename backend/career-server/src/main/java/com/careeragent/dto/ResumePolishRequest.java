package com.careeragent.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record ResumePolishRequest(@NotBlank @Size(max = 50) String section,
                                  @NotBlank @Size(max = 10000) String content) {}
