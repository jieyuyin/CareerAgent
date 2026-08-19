package com.careeragent.web;
import com.careeragent.dto.*;import com.careeragent.service.InterviewService;import com.careeragent.vo.*;import jakarta.validation.Valid;import jakarta.validation.constraints.Positive;import java.util.List;import lombok.RequiredArgsConstructor;import org.springframework.validation.annotation.Validated;import org.springframework.web.bind.annotation.*;
@Validated @RestController @RequestMapping("/api/interviews") @RequiredArgsConstructor
public class InterviewController {
 private final InterviewService service;
 @PostMapping public ApiResponse<InterviewCreateVO> create(@Valid @RequestBody InterviewCreateRequest request){return ApiResponse.success(service.create(request));}
 @GetMapping public ApiResponse<List<InterviewSessionVO>> list(){return ApiResponse.success(service.list());}
 @GetMapping("/{id}") public ApiResponse<InterviewSessionVO> get(@PathVariable @Positive Long id){return ApiResponse.success(service.get(id));}
 @GetMapping("/{id}/messages") public ApiResponse<List<InterviewMessageVO>> messages(@PathVariable @Positive Long id){return ApiResponse.success(service.messages(id));}
 @PostMapping("/{id}/message") public ApiResponse<InterviewMessageVO> message(@PathVariable @Positive Long id,@Valid @RequestBody InterviewMessageRequest request){return ApiResponse.success(service.reply(id,request));}
 @PostMapping("/{id}/finish") public ApiResponse<InterviewReportVO> finish(@PathVariable @Positive Long id){return ApiResponse.success(service.finish(id));}
}
