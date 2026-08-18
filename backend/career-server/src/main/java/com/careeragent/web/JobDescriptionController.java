package com.careeragent.web;

import com.careeragent.domain.enums.*;
import com.careeragent.dto.JobDescriptionRequest;
import com.careeragent.service.JobDescriptionService;
import com.careeragent.service.JobAnalysisService;
import com.careeragent.vo.*;
import jakarta.validation.Valid;
import jakarta.validation.constraints.*;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Validated @RestController @RequestMapping("/api/jobs") @RequiredArgsConstructor
public class JobDescriptionController {
    private final JobDescriptionService service;
    private final JobAnalysisService analysisService;
    @PostMapping public ApiResponse<JobDescriptionVO> create(@Valid @RequestBody JobDescriptionRequest request){return ApiResponse.success(service.create(request));}
    @GetMapping public ApiResponse<PageResponse<JobDescriptionVO>> list(@RequestParam(required=false) String company,
        @RequestParam(required=false) String city, @RequestParam(required=false) RecruitmentType recruitmentType,
        @RequestParam(required=false) JobStatus status, @RequestParam(required=false) String keyword,
        @RequestParam(defaultValue="1") @Min(1) long page, @RequestParam(defaultValue="20") @Min(1) @Max(100) long size){
        return ApiResponse.success(service.list(company,city,recruitmentType,status,keyword,page,size));}
    @GetMapping("/{id}") public ApiResponse<JobDescriptionDetailVO> get(@PathVariable @Positive Long id){return ApiResponse.success(service.get(id));}
    @PostMapping("/{id}/analyze") public ApiResponse<JobDescriptionVO> analyze(@PathVariable @Positive Long id){return ApiResponse.success(analysisService.analyze(id));}
    @PutMapping("/{id}") public ApiResponse<JobDescriptionVO> update(@PathVariable @Positive Long id,@Valid @RequestBody JobDescriptionRequest request){return ApiResponse.success(service.update(id,request));}
    @DeleteMapping("/{id}") public ApiResponse<Void> delete(@PathVariable @Positive Long id){service.delete(id);return ApiResponse.success();}
}
