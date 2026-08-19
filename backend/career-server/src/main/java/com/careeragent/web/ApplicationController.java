package com.careeragent.web;
import com.careeragent.domain.enums.ApplicationStatus;
import com.careeragent.dto.*;
import com.careeragent.service.ApplicationService;
import com.careeragent.service.ApplicationQueryService;
import com.careeragent.vo.*;
import jakarta.validation.Valid;
import jakarta.validation.constraints.*;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
@Validated @RestController @RequestMapping("/api/applications") @RequiredArgsConstructor
public class ApplicationController {
 private final ApplicationService service;
 private final ApplicationQueryService queryService;
 @PostMapping public ApiResponse<ApplicationVO> create(@Valid @RequestBody ApplicationRequest r){return ApiResponse.success(service.create(r));}
 @PostMapping("/manual") public ApiResponse<ApplicationVO> createManual(@Valid @RequestBody ManualApplicationRequest r){return ApiResponse.success(service.createManual(r));}
 @GetMapping public ApiResponse<PageResponse<ApplicationVO>> list(@RequestParam(required=false) ApplicationStatus status,@RequestParam(defaultValue="1") @Min(1) long page,@RequestParam(defaultValue="20") @Min(1) @Max(100) long size){return ApiResponse.success(service.list(status,page,size));}
 @GetMapping("/stats") public ApiResponse<ApplicationStatsVO> stats(){return ApiResponse.success(service.stats());}
 @GetMapping("/{id}") public ApiResponse<ApplicationDetailVO> get(@PathVariable @Positive Long id){return ApiResponse.success(queryService.detail(id));}
 @PutMapping("/{id}") public ApiResponse<ApplicationVO> update(@PathVariable @Positive Long id,@Valid @RequestBody ApplicationRequest r){return ApiResponse.success(service.update(id,r));}
 @PutMapping("/{id}/status") public ApiResponse<ApplicationVO> status(@PathVariable @Positive Long id,@Valid @RequestBody ApplicationStatusRequest r){return ApiResponse.success(service.updateStatus(id,r));}
 @PutMapping("/{id}/progress") public ApiResponse<ApplicationVO> progress(@PathVariable @Positive Long id,@Valid @RequestBody ApplicationProgressRequest r){return ApiResponse.success(service.updateProgress(id,r));}
 @GetMapping("/{id}/events") public ApiResponse<List<ApplicationEventVO>> events(@PathVariable @Positive Long id){return ApiResponse.success(service.events(id));}
}
