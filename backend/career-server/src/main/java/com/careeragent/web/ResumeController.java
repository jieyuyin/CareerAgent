package com.careeragent.web;
import com.careeragent.dto.ResumeRequest;
import com.careeragent.dto.ResumeParseRequest;
import com.careeragent.agent.structured.ResumeDiagnosisOutput;
import com.careeragent.agent.structured.ResumeParseOutput;
import com.careeragent.service.ResumeIntelligenceService;
import com.careeragent.service.ResumeService;
import com.careeragent.vo.ResumeUploadDraftVO;
import com.careeragent.vo.ResumeVO;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Positive;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
@Validated @RestController @RequestMapping("/api/resumes") @RequiredArgsConstructor
public class ResumeController {
 private final ResumeService service;
 private final ResumeIntelligenceService intelligenceService;
 @PostMapping public ApiResponse<ResumeVO> create(@Valid @RequestBody ResumeRequest r){return ApiResponse.success(service.create(r));}
 @GetMapping public ApiResponse<List<ResumeVO>> list(){return ApiResponse.success(service.list());}
 @GetMapping("/current") public ApiResponse<ResumeVO> current(){return ApiResponse.success(service.current());}
 @PostMapping(value = "/upload", consumes = "multipart/form-data") public ApiResponse<ResumeUploadDraftVO> upload(@RequestPart("file") MultipartFile file){return ApiResponse.success(intelligenceService.uploadAndParse(file));}
 @PostMapping("/parse") public ApiResponse<ResumeParseOutput> parse(@Valid @RequestBody ResumeParseRequest r){return ApiResponse.success(intelligenceService.parse(r.text()));}
 @PostMapping("/{id}/diagnosis") public ApiResponse<ResumeDiagnosisOutput> diagnosis(@PathVariable @Positive Long id){return ApiResponse.success(intelligenceService.diagnose(id));}
 @GetMapping("/{id}") public ApiResponse<ResumeVO> get(@PathVariable @Positive Long id){return ApiResponse.success(service.get(id));}
 @PutMapping("/{id}") public ApiResponse<ResumeVO> update(@PathVariable @Positive Long id,@Valid @RequestBody ResumeRequest r){return ApiResponse.success(service.update(id,r));}
 @PutMapping("/{id}/default") public ApiResponse<ResumeVO> setDefault(@PathVariable @Positive Long id){return ApiResponse.success(service.setDefault(id));}
 @DeleteMapping("/{id}") public ApiResponse<Void> delete(@PathVariable @Positive Long id){service.delete(id);return ApiResponse.success();}
}
