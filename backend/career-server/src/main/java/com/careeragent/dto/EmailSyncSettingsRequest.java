package com.careeragent.dto;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;

public record EmailSyncSettingsRequest(@NotNull Boolean enabled,
        @NotNull @Min(1) @Max(24) Integer intervalHours) {}
