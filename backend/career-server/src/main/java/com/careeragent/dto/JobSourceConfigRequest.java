package com.careeragent.dto;

import com.careeragent.domain.enums.OfficialSourceType;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public record JobSourceConfigRequest(
        @NotBlank @Size(max = 200) String company,
        @NotNull OfficialSourceType sourceType,
        @NotBlank @Size(max = 2000) String apiUrl,
        @Size(max = 2000) String careerUrl,
        Boolean enabled) {}
