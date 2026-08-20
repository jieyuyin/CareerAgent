package com.careeragent.web;
import com.careeragent.dto.EmailAccountRequest;
import com.careeragent.dto.EmailSyncSettingsRequest;
import com.careeragent.service.EmailAccountService;
import com.careeragent.vo.*;
import jakarta.validation.Valid;
import java.util.List;
import jakarta.validation.constraints.Positive;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
@RestController @RequestMapping("/api/email") @RequiredArgsConstructor
public class EmailController {
 private final EmailAccountService service;
 @GetMapping("/account") public ApiResponse<EmailAccountVO> account(){return ApiResponse.success(service.current());}
 @PostMapping("/test") public ApiResponse<Void> test(@Valid @RequestBody EmailAccountRequest request){service.test(request);return ApiResponse.success();}
 @PostMapping("/account") public ApiResponse<EmailAccountVO> bind(@Valid @RequestBody EmailAccountRequest request){return ApiResponse.success(service.bind(request));}
 @PutMapping("/account/sync-settings") public ApiResponse<EmailAccountVO> syncSettings(@Valid @RequestBody EmailSyncSettingsRequest request){return ApiResponse.success(service.updateSyncSettings(request));}
 @PostMapping("/sync") public ApiResponse<EmailSyncResultVO> sync(){return ApiResponse.success(service.sync());}
 @GetMapping("/recruitment-emails") public ApiResponse<List<RecruitmentEmailVO>> emails(){return ApiResponse.success(service.emails());}
 @PostMapping("/recruitment-emails/{id}/reanalyze") public ApiResponse<RecruitmentEmailVO> reanalyze(@PathVariable @Positive Long id){return ApiResponse.success(service.reanalyze(id));}
 @PutMapping("/recruitment-emails/{id}/application/{applicationId}") public ApiResponse<RecruitmentEmailVO> link(@PathVariable @Positive Long id,@PathVariable @Positive Long applicationId){return ApiResponse.success(service.link(id,applicationId));}
}
