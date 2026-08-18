package com.careeragent.service;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.careeragent.domain.entity.*;
import com.careeragent.domain.enums.*;
import com.careeragent.dto.JobDescriptionRequest;
import com.careeragent.exception.*;
import com.careeragent.mapper.*;
import com.careeragent.security.CurrentUserProvider;
import com.careeragent.vo.*;
import com.careeragent.web.PageResponse;
import java.util.*;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

@Service
@RequiredArgsConstructor
public class JobDescriptionService {
    private final JobDescriptionMapper jobMapper;
    private final ResumeVersionMapper versionMapper;
    private final JobApplicationMapper applicationMapper;
    private final CurrentUserProvider currentUser;

    @Transactional
    public JobDescriptionVO create(JobDescriptionRequest request) {
        var entity = toEntity(request, new JobDescription());
        entity.setUserId(currentUser.getCurrentUserId());
        jobMapper.insert(entity);
        return JobDescriptionVO.from(entity);
    }

    public PageResponse<JobDescriptionVO> list(String company, String city, RecruitmentType recruitmentType,
                                                JobStatus status, String keyword, long page, long size) {
        var query = Wrappers.<JobDescription>lambdaQuery().eq(JobDescription::getUserId, currentUser.getCurrentUserId())
                .eq(StringUtils.hasText(company), JobDescription::getCompany, company)
                .like(StringUtils.hasText(city), JobDescription::getCity, StringUtils.hasText(city) ? city.trim() : city)
                .eq(recruitmentType != null, JobDescription::getRecruitmentType, recruitmentType)
                .eq(status != null, JobDescription::getStatus, status)
                .and(StringUtils.hasText(keyword), q -> q.like(JobDescription::getCompany, keyword)
                        .or().like(JobDescription::getJobName, keyword))
                .orderByDesc(JobDescription::getCreatedAt);
        var result = jobMapper.selectPage(Page.of(page, size), query);
        return new PageResponse<>(result.getRecords().stream().map(JobDescriptionVO::from).toList(),
                result.getTotal(), result.getCurrent(), result.getSize(), result.getPages());
    }

    public JobDescriptionDetailVO get(Long id) {
        var entity = owned(id);
        var vo = new JobDescriptionDetailVO();
        BeanUtils.copyProperties(entity, vo);
        vo.setHasResumeVersion(versionMapper.selectCount(Wrappers.<ResumeVersion>lambdaQuery()
                .eq(ResumeVersion::getUserId, currentUser.getCurrentUserId()).eq(ResumeVersion::getJobDescriptionId, id)) > 0);
        vo.setHasApplication(applicationMapper.selectCount(Wrappers.<JobApplication>lambdaQuery()
                .eq(JobApplication::getUserId, currentUser.getCurrentUserId()).eq(JobApplication::getJobDescriptionId, id)) > 0);
        return vo;
    }

    @Transactional
    public JobDescriptionVO applyAnalysis(Long id, com.careeragent.agent.structured.JobAnalysisOutput output) {
        var entity = owned(id);
        if (org.springframework.util.StringUtils.hasText(output.jobName())) entity.setJobName(output.jobName());
        entity.setResponsibilities(orEmpty(output.responsibilities()));
        entity.setRequiredSkills(orEmpty(output.requiredSkills()));
        entity.setPreferredSkills(orEmpty(output.preferredSkills()));
        entity.setKeywords(output.keywords() == null ? List.of() : output.keywords().stream().filter(Objects::nonNull).distinct().toList());
        entity.setEducationRequirement(output.educationRequirement()); entity.setExperienceRequirement(output.experienceRequirement());
        entity.setJobFocus(orEmpty(output.jobFocus())); entity.setInterviewTopics(orEmpty(output.interviewTopics()));
        jobMapper.updateById(entity); return JobDescriptionVO.from(entity);
    }

    @Transactional
    public JobDescriptionVO update(Long id, JobDescriptionRequest request) {
        var entity = toEntity(request, owned(id));
        jobMapper.updateById(entity);
        return JobDescriptionVO.from(entity);
    }

    @Transactional
    public void delete(Long id) {
        owned(id);
        if (versionMapper.selectCount(Wrappers.<ResumeVersion>lambdaQuery().eq(ResumeVersion::getJobDescriptionId, id)) > 0
                || applicationMapper.selectCount(Wrappers.<JobApplication>lambdaQuery().eq(JobApplication::getJobDescriptionId, id)) > 0) {
            throw new BusinessException(40901, "Job is referenced and cannot be deleted");
        }
        jobMapper.deleteById(id);
    }

    JobDescription owned(Long id) {
        var entity = jobMapper.selectOne(Wrappers.<JobDescription>lambdaQuery().eq(JobDescription::getId, id)
                .eq(JobDescription::getUserId, currentUser.getCurrentUserId()));
        if (entity == null) throw new ResourceNotFoundException("JobDescription", id);
        return entity;
    }

    private JobDescription toEntity(JobDescriptionRequest request, JobDescription entity) {
        BeanUtils.copyProperties(request, entity);
        entity.setResponsibilities(orEmpty(request.getResponsibilities()));
        entity.setRequiredSkills(orEmpty(request.getRequiredSkills()));
        entity.setPreferredSkills(orEmpty(request.getPreferredSkills()));
        entity.setKeywords(orEmpty(request.getKeywords()));
        entity.setJobFocus(orEmpty(request.getJobFocus()));
        entity.setInterviewTopics(orEmpty(request.getInterviewTopics()));
        return entity;
    }
    private List<String> orEmpty(List<String> value) { return value == null ? List.of() : value; }
}
