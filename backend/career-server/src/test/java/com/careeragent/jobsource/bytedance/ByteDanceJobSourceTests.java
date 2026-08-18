package com.careeragent.jobsource.bytedance;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.careeragent.exception.BusinessException;
import com.careeragent.jobsource.JobSearchCondition;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.List;
import java.util.Map;
import org.junit.jupiter.api.Test;

class ByteDanceJobSourceTests {
    @Test
    void resolvesVerifiedLocationCodesAndRejectsUnknownCity() {
        var locations = new ByteDanceLocationService();
        locations.setLocations(Map.of("上海", "CT_125", "北京", "CT_11"));

        assertThat(locations.resolveCodes(List.of("上海", "北京"))).containsExactly("CT_125", "CT_11");
        assertThatThrownBy(() -> locations.resolveCodes(List.of("火星")))
                .isInstanceOf(BusinessException.class).hasMessageContaining("火星");
    }

    @Test
    void convertsPageToOffsetAndUsesLocationCodes() {
        var locations = new ByteDanceLocationService();
        locations.setLocations(Map.of("上海", "CT_125"));
        var client = new ByteDanceJobClient(new ObjectMapper(), locations);
        var condition = JobSearchCondition.builder().keyword("AI").cities(List.of("上海")).page(3).size(20).build();

        var body = client.buildRequestBody(condition);

        assertThat(body.get("offset")).isEqualTo(40);
        assertThat(body.get("limit")).isEqualTo(20);
        assertThat(body.get("location_code_list")).isEqualTo(List.of("CT_125"));
    }

    @Test
    void campusRequestUsesVerifiedPortalAndSubject() {
        var client = new ByteDanceJobClient(new ObjectMapper(), new ByteDanceLocationService());
        client.setCampusSubjectId("7649336829398468869");
        var condition = JobSearchCondition.builder().keyword("").page(2).size(10).build();

        var body = client.buildCampusRequestBody(condition);

        assertThat(body.get("portal_type")).isEqualTo(3);
        assertThat(body.get("offset")).isEqualTo(10);
        assertThat(body.get("subject_id_list")).isEqualTo(List.of("7649336829398468869"));
    }

    @Test
    void normalizesOnlyVerifiedResponseFields() {
        var client = mock(ByteDanceJobClient.class);
        var post = new ByteDanceJobResponse.JobPost("123", "AI 应用工程师", "负责 Agent 平台", "熟悉 Java",
                new ByteDanceJobResponse.NamedValue("上海", null), null, null);
        when(client.search(org.mockito.ArgumentMatchers.any())).thenReturn(
                new ByteDanceJobResponse(0, "ok", new ByteDanceJobResponse.Data(List.of(post), 1, null)));

        var jobs = new ByteDanceJobAdapter(client).searchJobs(
                JobSearchCondition.builder().keyword("AI").page(1).size(20).build());

        assertThat(jobs).hasSize(1);
        assertThat(jobs.get(0).getSourceJobId()).isEqualTo("123");
        assertThat(jobs.get(0).getCity()).isEqualTo("上海");
        assertThat(jobs.get(0).getRawContent()).contains("负责 Agent 平台", "熟悉 Java");
    }
}
