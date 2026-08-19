package com.careeragent.dto;

import jakarta.validation.constraints.Size;

public record ResumeGenerateRequest(Long jobId, @Size(max = 50000) String jdContent) {}
