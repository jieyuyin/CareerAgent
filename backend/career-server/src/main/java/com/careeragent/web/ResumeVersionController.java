package com.careeragent.web;
import com.careeragent.dto.ResumeVersionCreateRequest;
import com.careeragent.service.ResumeVersionService;
import com.careeragent.vo.ResumeVersionVO;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Positive;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
@Validated @RestController @RequestMapping("/api/resume-versions") @RequiredArgsConstructor
public class ResumeVersionController {
 private final ResumeVersionService service;
 @PostMapping public ApiResponse<ResumeVersionVO> create(@Valid @RequestBody ResumeVersionCreateRequest r){return ApiResponse.success(service.create(r));}
 @GetMapping public ApiResponse<List<ResumeVersionVO>> list(@RequestParam(required=false) @Positive Long resumeId,@RequestParam(required=false) @Positive Long jobDescriptionId){return ApiResponse.success(service.list(resumeId,jobDescriptionId));}
 @GetMapping("/{id}") public ApiResponse<ResumeVersionVO> get(@PathVariable @Positive Long id){return ApiResponse.success(service.get(id));}
}
