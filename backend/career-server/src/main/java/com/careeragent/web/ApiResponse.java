package com.careeragent.web;
import com.fasterxml.jackson.annotation.JsonInclude;
@JsonInclude(JsonInclude.Include.ALWAYS)
public record ApiResponse<T>(int code, String message, T data) {
    public static <T> ApiResponse<T> success(T data) { return new ApiResponse<>(0, "success", data); }
    public static ApiResponse<Void> success() { return new ApiResponse<>(0, "success", null); }
    public static ApiResponse<Void> error(int code, String message) { return new ApiResponse<>(code, message, null); }
}
