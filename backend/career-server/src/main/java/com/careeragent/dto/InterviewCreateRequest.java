package com.careeragent.dto;
import com.careeragent.domain.enums.*;import jakarta.validation.constraints.*;
public record InterviewCreateRequest(@Positive Long applicationId,@NotNull InterviewStage stage,@NotNull InterviewMode mode,@NotNull @Min(15) @Max(60) Integer duration,@Size(max=200) String model){}
