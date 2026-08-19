package com.careeragent.service;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.careeragent.domain.entity.*;
import com.careeragent.dto.ResumeRequest;
import com.careeragent.exception.*;
import com.careeragent.mapper.*;
import com.careeragent.security.CurrentUserProvider;
import com.careeragent.vo.ResumeVO;
import com.careeragent.domain.enums.ResumeSource;
import com.careeragent.domain.enums.ResumeStatus;
import java.util.*;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ResumeService {
    private final ResumeMapper resumeMapper;
    private final ResumeVersionMapper versionMapper;
    private final CurrentUserProvider currentUser;

    @Transactional
    public ResumeVO create(ResumeRequest request) {
        var entity = toEntity(request, new Resume());
        entity.setUserId(currentUser.getCurrentUserId());
        if (Boolean.TRUE.equals(entity.getIsDefault())) clearDefault();
        resumeMapper.insert(entity);
        return ResumeVO.from(entity);
    }
    public List<ResumeVO> list() {
        return resumeMapper.selectList(Wrappers.<Resume>lambdaQuery().eq(Resume::getUserId, currentUser.getCurrentUserId())
                .orderByDesc(Resume::getIsDefault).orderByDesc(Resume::getUpdatedAt)).stream().map(ResumeVO::from).toList();
    }
    public ResumeVO current() {
        var values = list();
        return values.isEmpty() ? null : values.get(0);
    }
    public Resume currentEntity() {
        var value = current();
        return value == null ? null : owned(value.getId());
    }
    public ResumeVO get(Long id) { return ResumeVO.from(owned(id)); }
    @Transactional
    public ResumeVO update(Long id, ResumeRequest request) {
        var entity = toEntity(request, owned(id));
        if (Boolean.TRUE.equals(entity.getIsDefault())) clearDefault();
        resumeMapper.updateById(entity);
        return ResumeVO.from(entity);
    }
    @Transactional
    public ResumeVO setDefault(Long id) {
        var entity = owned(id);
        clearDefault();
        entity.setIsDefault(true);
        resumeMapper.updateById(entity);
        return ResumeVO.from(entity);
    }
    @Transactional
    public void delete(Long id) {
        owned(id);
        if (versionMapper.selectCount(Wrappers.<ResumeVersion>lambdaQuery().eq(ResumeVersion::getResumeId, id)) > 0)
            throw new BusinessException(40902, "Resume has versions and cannot be deleted");
        resumeMapper.deleteById(id);
    }
    Resume owned(Long id) {
        var value = resumeMapper.selectOne(Wrappers.<Resume>lambdaQuery().eq(Resume::getId, id)
                .eq(Resume::getUserId, currentUser.getCurrentUserId()));
        if (value == null) throw new ResourceNotFoundException("Resume", id);
        return value;
    }
    private void clearDefault() {
        resumeMapper.update(null, Wrappers.<Resume>update().eq("user_id", currentUser.getCurrentUserId())
                .eq("is_default", true).set("is_default", false));
    }
    private Resume toEntity(ResumeRequest request, Resume entity) {
        BeanUtils.copyProperties(request, entity);
        entity.setEducation(request.getEducation() == null ? List.of() : request.getEducation());
        entity.setExperiences(request.getExperiences() == null ? List.of() : request.getExperiences());
        entity.setProjects(request.getProjects() == null ? List.of() : request.getProjects());
        entity.setSkills(request.getSkills() == null ? List.of() : request.getSkills());
        entity.setBasicInfo(request.getBasicInfo() == null ? Map.of() : request.getBasicInfo());
        if (entity.getSource() == null) entity.setSource(ResumeSource.CREATE);
        if (entity.getStatus() == null) entity.setStatus(ResumeStatus.CONFIRMED);
        if (entity.getIsDefault() == null) entity.setIsDefault(false);
        return entity;
    }
}
