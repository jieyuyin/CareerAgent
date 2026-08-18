package com.careeragent.service;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.careeragent.domain.entity.*;
import com.careeragent.domain.enums.*;
import com.careeragent.dto.*;
import com.careeragent.exception.*;
import com.careeragent.mapper.*;
import com.careeragent.security.CurrentUserProvider;
import com.careeragent.vo.*;
import com.careeragent.web.PageResponse;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ApplicationService {
    private final JobApplicationMapper mapper;
    private final ApplicationEventMapper eventMapper;
    private final JobDescriptionService jobService;
    private final ResumeVersionService versionService;
    private final CurrentUserProvider currentUser;

    @Transactional
    public ApplicationVO create(ApplicationRequest request) {
        jobService.owned(request.getJobDescriptionId());
        var version = versionService.owned(request.getResumeVersionId());
        if (version.getJobDescriptionId() != null && !version.getJobDescriptionId().equals(request.getJobDescriptionId()))
            throw new BusinessException(40003, "ResumeVersion belongs to a different job");
        var entity = toEntity(request, new JobApplication());
        entity.setUserId(currentUser.getCurrentUserId());
        mapper.insert(entity);
        addEvent(entity.getId(), null, entity.getStatus(), request.getRemark());
        return ApplicationVO.from(entity);
    }
    public PageResponse<ApplicationVO> list(ApplicationStatus status, long page, long size) {
        var result = mapper.selectPage(Page.of(page, size), Wrappers.<JobApplication>lambdaQuery()
                .eq(JobApplication::getUserId, currentUser.getCurrentUserId())
                .eq(status != null, JobApplication::getStatus, status).orderByDesc(JobApplication::getUpdatedAt));
        return new PageResponse<>(result.getRecords().stream().map(ApplicationVO::from).toList(), result.getTotal(),
                result.getCurrent(), result.getSize(), result.getPages());
    }
    public ApplicationDetailVO get(Long id) {
        var entity = owned(id);
        var vo = new ApplicationDetailVO(); BeanUtils.copyProperties(entity, vo);
        vo.setJob(jobService.get(entity.getJobDescriptionId()));
        vo.setResumeVersion(versionService.get(entity.getResumeVersionId()));
        vo.setEvents(events(id));
        return vo;
    }
    @Transactional
    public ApplicationVO update(Long id, ApplicationRequest request) {
        jobService.owned(request.getJobDescriptionId());
        var version = versionService.owned(request.getResumeVersionId());
        if (version.getJobDescriptionId() != null && !version.getJobDescriptionId().equals(request.getJobDescriptionId()))
            throw new BusinessException(40003, "ResumeVersion belongs to a different job");
        var entity = owned(id); var oldStatus = entity.getStatus();
        toEntity(request, entity); mapper.updateById(entity);
        if (oldStatus != entity.getStatus()) addEvent(id, oldStatus, entity.getStatus(), request.getRemark());
        return ApplicationVO.from(entity);
    }
    @Transactional
    public ApplicationVO updateStatus(Long id, ApplicationStatusRequest request) {
        var entity = owned(id); var oldStatus = entity.getStatus();
        if (oldStatus == request.getStatus()) throw new BusinessException(40004, "Application already has this status");
        entity.setStatus(request.getStatus()); mapper.updateById(entity);
        addEvent(id, oldStatus, request.getStatus(), request.getRemark());
        return ApplicationVO.from(entity);
    }
    public List<ApplicationEventVO> events(Long id) {
        owned(id);
        return eventMapper.selectList(Wrappers.<ApplicationEvent>lambdaQuery().eq(ApplicationEvent::getApplicationId, id)
                .orderByAsc(ApplicationEvent::getCreatedAt).orderByAsc(ApplicationEvent::getId)).stream()
                .map(ApplicationEventVO::from).toList();
    }
    JobApplication owned(Long id) {
        var value = mapper.selectOne(Wrappers.<JobApplication>lambdaQuery().eq(JobApplication::getId, id)
                .eq(JobApplication::getUserId, currentUser.getCurrentUserId()));
        if (value == null) throw new ResourceNotFoundException("Application", id);
        return value;
    }
    private JobApplication toEntity(ApplicationRequest request, JobApplication entity) {
        BeanUtils.copyProperties(request, entity); return entity;
    }
    private void addEvent(Long applicationId, ApplicationStatus from, ApplicationStatus to, String remark) {
        var event = new ApplicationEvent(); event.setApplicationId(applicationId); event.setFromStatus(from);
        event.setToStatus(to); event.setEventType(ApplicationEventType.STATUS_CHANGE); event.setRemark(remark);
        eventMapper.insert(event);
    }
}
