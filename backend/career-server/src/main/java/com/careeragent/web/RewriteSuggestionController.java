package com.careeragent.web;
import com.careeragent.service.RewriteSuggestionService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
@RestController @RequestMapping("/api/rewrite-suggestions") @RequiredArgsConstructor
public class RewriteSuggestionController {
 private final RewriteSuggestionService service;
 @GetMapping("/{id}") public ApiResponse<?> get(@PathVariable Long id){return ApiResponse.success(service.get(id));}
 @PostMapping("/{id}/accept") public ApiResponse<?> accept(@PathVariable Long id){return ApiResponse.success(service.accept(id));}
 @PostMapping("/{id}/reject") public ApiResponse<?> reject(@PathVariable Long id){return ApiResponse.success(service.reject(id));}
 @PostMapping("/{id}/regenerate") public ApiResponse<?> regenerate(@PathVariable Long id){return ApiResponse.success(service.regenerate(id));}
}
