package com.careeragent.web;
import com.careeragent.dto.ResumeRequest;
import com.careeragent.dto.ResumeParseRequest;
import com.careeragent.dto.ResumeGenerateRequest;
import com.careeragent.dto.ResumePolishRequest;
import com.careeragent.agent.structured.ResumeDiagnosisOutput;
import com.careeragent.agent.structured.ResumeParseOutput;
import com.careeragent.service.ResumeIntelligenceService;
import com.careeragent.service.ResumeService;
import com.careeragent.service.ResumeAgentService;
import com.careeragent.vo.ResumeUploadDraftVO;
import com.careeragent.vo.ResumeVO;
import com.careeragent.vo.ResumeProfileVO;
import com.careeragent.vo.ResumeVersionVO;
import com.careeragent.agent.structured.ResumePolishOutput;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Positive;
import java.util.List;
import org.springframework.http.*;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
@Validated @RestController @RequestMapping("/api/resumes") @RequiredArgsConstructor
public class ResumeController {
 private final ResumeService service;
 private final ResumeIntelligenceService intelligenceService;
 private final ResumeAgentService agentService;
 @PostMapping public ApiResponse<ResumeVO> create(@Valid @RequestBody ResumeRequest r){return ApiResponse.success(service.create(r));}
 @GetMapping public ApiResponse<List<ResumeVO>> list(){return ApiResponse.success(service.list());}
 @GetMapping("/current") public ApiResponse<ResumeVO> current(){return ApiResponse.success(service.current());}
 @GetMapping("/profile") public ApiResponse<ResumeProfileVO> profile(){return ApiResponse.success(ResumeProfileVO.from(service.current()));}
 @PutMapping("/profile") public ApiResponse<ResumeVO> updateProfile(@Valid @RequestBody ResumeRequest r){var current=service.current();return ApiResponse.success(current==null?service.create(r):service.update(current.getId(),r));}
 @PostMapping(value = "/upload", consumes = "multipart/form-data") public ApiResponse<ResumeUploadDraftVO> upload(@RequestPart("file") MultipartFile file){return ApiResponse.success(intelligenceService.uploadAndParse(file));}
 @PostMapping("/parse") public ApiResponse<ResumeParseOutput> parse(@Valid @RequestBody ResumeParseRequest r){return ApiResponse.success(intelligenceService.parse(r.text()));}
 @PostMapping("/{id}/diagnosis") public ApiResponse<ResumeDiagnosisOutput> diagnosis(@PathVariable @Positive Long id){return ApiResponse.success(intelligenceService.diagnose(id));}
 @PostMapping("/polish") public ApiResponse<ResumePolishOutput> polish(@Valid @RequestBody ResumePolishRequest r){return ApiResponse.success(agentService.polish(r));}
 @PostMapping("/generate") public ApiResponse<ResumeVersionVO> generate(@Valid @RequestBody ResumeGenerateRequest r){return ApiResponse.success(agentService.generate(r));}
 @GetMapping("/versions") public ApiResponse<List<ResumeVersionVO>> versions(){return ApiResponse.success(agentService.versions());}
 @GetMapping("/profile/export/pdf") public ResponseEntity<byte[]> exportMasterPdf(){return ResponseEntity.ok().header(HttpHeaders.CONTENT_DISPOSITION,"attachment; filename=master-resume.pdf").contentType(MediaType.APPLICATION_PDF).body(agentService.exportMasterPdf());}
 @GetMapping("/{id}/export/pdf") public ResponseEntity<byte[]> exportPdf(@PathVariable @Positive Long id){return ResponseEntity.ok().header(HttpHeaders.CONTENT_DISPOSITION,"attachment; filename=career-resume-"+id+".pdf").contentType(MediaType.APPLICATION_PDF).body(agentService.exportPdf(id));}
 @GetMapping("/{id}") public ApiResponse<ResumeVO> get(@PathVariable @Positive Long id){return ApiResponse.success(service.get(id));}
 @PutMapping("/{id}") public ApiResponse<ResumeVO> update(@PathVariable @Positive Long id,@Valid @RequestBody ResumeRequest r){return ApiResponse.success(service.update(id,r));}
 @PutMapping("/{id}/default") public ApiResponse<ResumeVO> setDefault(@PathVariable @Positive Long id){return ApiResponse.success(service.setDefault(id));}
 @DeleteMapping("/{id}") public ApiResponse<Void> delete(@PathVariable @Positive Long id){service.delete(id);return ApiResponse.success();}
}
