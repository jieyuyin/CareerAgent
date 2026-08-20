package com.careeragent.web;

import com.careeragent.agent.llm.RoutingLLMAdapter;
import com.careeragent.dto.AiConfigRequest;
import com.careeragent.service.AiConfigService;
import com.careeragent.vo.AiConfigVO;
import com.careeragent.vo.AiModelLibraryItemVO;
import java.util.List;
import jakarta.validation.Valid;
import java.util.Map;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/system/ai-config")
@RequiredArgsConstructor
public class AiConfigController {
    private final AiConfigService service;
    private final RoutingLLMAdapter adapter;
    @GetMapping public ApiResponse<AiConfigVO> current(){return ApiResponse.success(service.get());}
    @GetMapping("/models") public ApiResponse<List<AiModelLibraryItemVO>> models(){return ApiResponse.success(service.list());}
    @PutMapping public ApiResponse<AiConfigVO> save(@Valid @RequestBody AiConfigRequest request){return ApiResponse.success(service.save(request));}
    @PostMapping("/test") public ApiResponse<Map<String,Object>> test(@Valid @RequestBody AiConfigRequest request){return ApiResponse.success(adapter.test(request));}
}
