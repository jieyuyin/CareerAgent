package com.careeragent.web;

import java.time.Instant;
import java.util.Map;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/health")
public class HealthController {
    @GetMapping
    public Map<String, Object> health() {
        return Map.of("status", "UP", "service", "career-server", "timestamp", Instant.now().toString());
    }
}
