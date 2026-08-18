package com.careeragent.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.careeragent.domain.entity.JobDescription;
import com.careeragent.domain.enums.JobSource;
import com.careeragent.jobsource.JobSearchCondition;
import com.careeragent.jobsource.JobSourceAdapter;
import com.careeragent.jobsource.NormalizedJob;
import com.careeragent.mapper.JobDescriptionMapper;
import com.careeragent.security.CurrentUserProvider;
import java.util.List;
import org.junit.jupiter.api.Test;

class JobImportServiceTests {
    @Test
    void repeatedImportUpdatesExistingJobInsteadOfInsertingDuplicate() {
        var adapter = mock(JobSourceAdapter.class);
        var mapper = mock(JobDescriptionMapper.class);
        var user = mock(CurrentUserProvider.class);
        var normalized = NormalizedJob.builder().source("BYTEDANCE").sourceJobId("123")
                .company("字节跳动").jobName("AI 应用工程师").city("上海")
                .recruitmentType("SOCIAL").sourceUrl("https://jobs.bytedance.com/experienced/position/123/detail")
                .rawContent("完整 JD").build();
        when(adapter.supports("BYTEDANCE")).thenReturn(true);
        when(adapter.searchJobs(any())).thenReturn(List.of(normalized));
        when(user.getCurrentUserId()).thenReturn(1L);
        var existing = new JobDescription(); existing.setId(9L); existing.setUserId(1L);
        existing.setSource(JobSource.BYTEDANCE); existing.setSourceJobId("123");
        when(mapper.selectOne(any())).thenReturn(null, existing);
        var service = new JobImportService(List.of(adapter), mapper, user);
        var condition = JobSearchCondition.builder().keyword("AI").page(1).size(20).build();

        var first = service.searchAndImport("BYTEDANCE", condition);
        var second = service.searchAndImport("BYTEDANCE", condition);

        assertThat(first.created()).isEqualTo(1);
        assertThat(second.updated()).isEqualTo(1);
        verify(mapper).insert(any(JobDescription.class));
        verify(mapper).updateById(existing);
    }
}
