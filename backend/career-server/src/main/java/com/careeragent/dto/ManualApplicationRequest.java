package com.careeragent.dto;

import com.careeragent.domain.enums.ApplicationChannel;
import com.careeragent.domain.enums.ApplicationStatus;
import com.careeragent.domain.enums.ApplicationInterviewStage;
import jakarta.validation.constraints.*;
import java.time.OffsetDateTime;

public record ManualApplicationRequest(@NotBlank @Size(max=200) String company,
        @NotBlank @Size(max=200) String jobName, @NotNull ApplicationStatus status, ApplicationInterviewStage interviewStage,
        ApplicationChannel channel, OffsetDateTime appliedAt, @Size(max=500) String nextAction,
        String remark, @Size(max=50000) String jdContent, Long recruitmentEmailId) {}
