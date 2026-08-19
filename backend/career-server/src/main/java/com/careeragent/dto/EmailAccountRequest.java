package com.careeragent.dto;
import jakarta.validation.constraints.*;
public record EmailAccountRequest(@NotBlank @Email @Pattern(regexp="^[^@]+@163\\.com$", message="只支持 163 邮箱") String email,
        @NotBlank @Size(min=4,max=100) String authorizationCode) {}
