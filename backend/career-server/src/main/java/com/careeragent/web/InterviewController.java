package com.careeragent.web;
import com.careeragent.dto.*;import com.careeragent.service.InterviewService;import com.careeragent.vo.*;import jakarta.validation.Valid;import jakarta.validation.constraints.Positive;import java.util.List;import lombok.RequiredArgsConstructor;import org.springframework.validation.annotation.Validated;import org.springframework.web.bind.annotation.*;
import java.util.Map;import java.util.concurrent.CompletableFuture;import org.springframework.http.MediaType;import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;
@Validated @RestController @RequestMapping("/api/interviews") @RequiredArgsConstructor
public class InterviewController {
 private final InterviewService service;
 @PostMapping public ApiResponse<InterviewCreateVO> create(@Valid @RequestBody InterviewCreateRequest request){return ApiResponse.success(service.create(request));}
 @GetMapping public ApiResponse<List<InterviewSessionVO>> list(){return ApiResponse.success(service.list());}
 @GetMapping("/{id}") public ApiResponse<InterviewSessionVO> get(@PathVariable @Positive Long id){return ApiResponse.success(service.get(id));}
 @GetMapping("/{id}/messages") public ApiResponse<List<InterviewMessageVO>> messages(@PathVariable @Positive Long id){return ApiResponse.success(service.messages(id));}
 @GetMapping("/{id}/evaluations") public ApiResponse<List<com.careeragent.domain.entity.InterviewEvaluation>> evaluations(@PathVariable @Positive Long id){return ApiResponse.success(service.evaluations(id));}
 @PostMapping("/{id}/message") public ApiResponse<InterviewMessageVO> message(@PathVariable @Positive Long id,@Valid @RequestBody InterviewMessageRequest request){return ApiResponse.success(service.reply(id,request));}
 @PostMapping(value="/{id}/message/stream",produces=MediaType.TEXT_EVENT_STREAM_VALUE) public SseEmitter streamMessage(@PathVariable @Positive Long id,@Valid @RequestBody InterviewMessageRequest request){var emitter=new SseEmitter(60_000L);CompletableFuture.runAsync(()->{try{var message=service.streamReply(id,request,delta->{try{emitter.send(SseEmitter.event().name("delta").data(Map.of("content",delta)));}catch(Exception exception){service.cancelReply(id);throw new RuntimeException(exception);}});emitter.send(SseEmitter.event().name("done").data(message));emitter.complete();}catch(Exception exception){try{emitter.send(SseEmitter.event().name("error").data(Map.of("message",exception.getMessage())));}catch(Exception ignored){}emitter.complete();}});return emitter;}
 @PostMapping("/{id}/message/cancel") public ApiResponse<Boolean> cancelMessage(@PathVariable @Positive Long id){return ApiResponse.success(service.cancelReply(id));}
 @PostMapping("/{id}/finish") public ApiResponse<InterviewReportVO> finish(@PathVariable @Positive Long id){return ApiResponse.success(service.finish(id));}
}
