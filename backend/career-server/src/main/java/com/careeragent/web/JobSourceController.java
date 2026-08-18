package com.careeragent.web;

import com.careeragent.domain.entity.JobSourceConfig;
import com.careeragent.dto.JobSourceConfigRequest;
import com.careeragent.service.OfficialJobSourceService;
import com.careeragent.service.JobImportService;
import com.careeragent.jobsource.JobSearchCondition;
import com.careeragent.vo.JobImportResultVO;
import com.careeragent.vo.JobSourceSyncResultVO;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Positive;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/job-sources")
@RequiredArgsConstructor
public class JobSourceController {
    private final OfficialJobSourceService service;
    private final JobImportService importService;

    @GetMapping public ApiResponse<List<JobSourceConfig>> list() { return ApiResponse.success(service.list()); }
    @GetMapping("/{id}") public ApiResponse<JobSourceConfig> get(@PathVariable @Positive Long id) { return ApiResponse.success(service.get(id)); }
    @PostMapping public ApiResponse<JobSourceConfig> create(@Valid @RequestBody JobSourceConfigRequest request) { return ApiResponse.success(service.create(request)); }
    @PutMapping("/{id}") public ApiResponse<JobSourceConfig> update(@PathVariable @Positive Long id, @Valid @RequestBody JobSourceConfigRequest request) { return ApiResponse.success(service.update(id, request)); }
    @DeleteMapping("/{id}") public ApiResponse<Void> delete(@PathVariable @Positive Long id) { service.delete(id); return ApiResponse.success(null); }
    @PostMapping("/{id}/sync") public ApiResponse<JobSourceSyncResultVO> sync(@PathVariable @Positive Long id) { return ApiResponse.success(service.sync(id)); }
    @PostMapping("/bytedance/search") public ApiResponse<JobImportResultVO> searchByteDance(@Valid @RequestBody JobSearchCondition condition) {
        return ApiResponse.success(importService.searchAndImport("BYTEDANCE", condition));
    }
    @PostMapping("/bytedance/campus/search") public ApiResponse<JobImportResultVO> searchByteDanceCampus(@Valid @RequestBody JobSearchCondition condition) {
        return ApiResponse.success(importService.searchAndImport("BYTEDANCE_CAMPUS", condition));
    }
}
