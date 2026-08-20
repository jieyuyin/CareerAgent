package com.careeragent.vo;

import java.time.OffsetDateTime;

public record AiModelLibraryItemVO(
        Long id,
        String provider,
        String model,
        String baseUrl,
        boolean apiKeyConfigured,
        String apiKeyMasked,
        boolean active,
        OffsetDateTime createdAt,
        OffsetDateTime updatedAt) {}
