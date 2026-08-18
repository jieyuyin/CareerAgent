package com.careeragent.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record ResumeParseRequest(@NotBlank @Size(max = 200000) String text) {}
