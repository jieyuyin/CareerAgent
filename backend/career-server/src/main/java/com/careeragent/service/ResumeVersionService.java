package com.careeragent.service;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.careeragent.domain.entity.ResumeVersion;
import com.careeragent.dto.ResumeVersionCreateRequest;
import com.careeragent.exception.ResourceNotFoundException;
import com.careeragent.mapper.ResumeVersionMapper;
import com.careeragent.security.CurrentUserProvider;
import com.careeragent.vo.ResumeVersionVO;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ResumeVersionService {
    private final ResumeVersionMapper mapper;
    private final ResumeService resumeService;
    private final JobDescriptionService jobService;
    private final CurrentUserProvider currentUser;
    @Transactional
    public ResumeVersionVO create(ResumeVersionCreateRequest request) {
        resumeService.owned(request.getResumeId());
        if (request.getJobDescriptionId() != null) jobService.owned(request.getJobDescriptionId());
        var entity = new ResumeVersion();
        BeanUtils.copyProperties(request, entity);
        entity.setUserId(currentUser.getCurrentUserId());
        mapper.insert(entity);
        return ResumeVersionVO.from(entity);
    }
    public List<ResumeVersionVO> list(Long resumeId, Long jobDescriptionId) {
        return mapper.selectList(Wrappers.<ResumeVersion>lambdaQuery().eq(ResumeVersion::getUserId, currentUser.getCurrentUserId())
                .eq(resumeId != null, ResumeVersion::getResumeId, resumeId)
                .eq(jobDescriptionId != null, ResumeVersion::getJobDescriptionId, jobDescriptionId)
                .orderByDesc(ResumeVersion::getCreatedAt)).stream().map(ResumeVersionVO::from).toList();
    }
    public ResumeVersionVO get(Long id) { return ResumeVersionVO.from(owned(id)); }
    ResumeVersion owned(Long id) {
        var value = mapper.selectOne(Wrappers.<ResumeVersion>lambdaQuery().eq(ResumeVersion::getId, id)
                .eq(ResumeVersion::getUserId, currentUser.getCurrentUserId()));
        if (value == null) throw new ResourceNotFoundException("ResumeVersion", id);
        return value;
    }
}
