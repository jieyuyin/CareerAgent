package com.careeragent.dto;
import jakarta.validation.constraints.*;
public record InterviewMessageRequest(@NotBlank @Size(max=10000) String content,@Size(max=200) String model){}
