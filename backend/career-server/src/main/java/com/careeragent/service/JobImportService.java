package com.careeragent.service;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.careeragent.domain.entity.JobDescription;
import com.careeragent.domain.enums.JobSource;
import com.careeragent.domain.enums.JobStatus;
import com.careeragent.domain.enums.RecruitmentType;
import com.careeragent.exception.BusinessException;
import com.careeragent.jobsource.JobSearchCondition;
import com.careeragent.jobsource.JobSourceAdapter;
import com.careeragent.jobsource.NormalizedJob;
import com.careeragent.mapper.JobDescriptionMapper;
import com.careeragent.security.CurrentUserProvider;
import com.careeragent.vo.JobDescriptionVO;
import com.careeragent.vo.JobImportResultVO;
import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

@Service
@RequiredArgsConstructor
public class JobImportService {
    private final List<JobSourceAdapter> adapters;
    private final JobDescriptionMapper jobMapper;
    private final CurrentUserProvider currentUser;

    @Transactional
    public JobImportResultVO searchAndImport(String source, JobSearchCondition condition) {
        var adapter = adapters.stream().filter(item -> item.supports(source)).findFirst()
                .orElseThrow(() -> new BusinessException(40042, "不支持的岗位来源：" + source));
        var normalizedJobs = adapter.searchJobs(condition);
        int created = 0, updated = 0;
        var jobs = new ArrayList<JobDescriptionVO>();
        for (var normalized : normalizedJobs) {
            if (!StringUtils.hasText(normalized.getSourceJobId()) || !StringUtils.hasText(normalized.getJobName())) continue;
            var jobSource = JobSource.valueOf(normalized.getSource());
            var entity = jobMapper.selectOne(Wrappers.<JobDescription>lambdaQuery()
                    .eq(JobDescription::getUserId, currentUser.getCurrentUserId())
                    .eq(JobDescription::getSource, jobSource)
                    .eq(JobDescription::getSourceJobId, normalized.getSourceJobId()));
            boolean isNew = entity == null;
            if (isNew) {
                entity = new JobDescription();
                entity.setUserId(currentUser.getCurrentUserId());
                entity.setSource(jobSource);
                entity.setSourceJobId(normalized.getSourceJobId());
            }
            apply(normalized, entity);
            if (isNew) { jobMapper.insert(entity); created++; } else { jobMapper.updateById(entity); updated++; }
            jobs.add(JobDescriptionVO.from(entity));
        }
        return new JobImportResultVO(normalizedJobs.size(), created, updated, jobs);
    }

    private void apply(NormalizedJob source, JobDescription target) {
        target.setCompany(source.getCompany());
        target.setJobName(source.getJobName());
        target.setCity(source.getCity());
        target.setRecruitmentType(RecruitmentType.valueOf(source.getRecruitmentType()));
        target.setSourceUrl(source.getSourceUrl());
        target.setRawContent(source.getRawContent());
        target.setStatus(JobStatus.OPEN);
        target.setLastVerifiedAt(OffsetDateTime.now());
    }
}
