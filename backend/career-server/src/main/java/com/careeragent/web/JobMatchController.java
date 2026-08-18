package com.careeragent.web;
import com.careeragent.domain.entity.JobMatchReport;
import com.careeragent.service.JobMatchReportService;
import jakarta.validation.constraints.Positive;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
@Validated @RestController @RequestMapping("/api/job-matches") @RequiredArgsConstructor
public class JobMatchController {
 private final JobMatchReportService service;
 @GetMapping("/latest") public ApiResponse<JobMatchReport> latest(@RequestParam @Positive Long jobDescriptionId,@RequestParam @Positive Long resumeId){return ApiResponse.success(service.latest(jobDescriptionId,resumeId));}
 @PostMapping public ApiResponse<JobMatchReport> generate(@RequestParam @Positive Long jobDescriptionId,@RequestParam @Positive Long resumeId){return ApiResponse.success(service.generate(jobDescriptionId,resumeId));}
}
