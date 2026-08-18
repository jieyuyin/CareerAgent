package com.careeragent.jobsource.bytedance;

import com.careeragent.jobsource.JobSearchCondition;
import com.careeragent.jobsource.JobSourceAdapter;
import com.careeragent.jobsource.NormalizedJob;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import org.springframework.stereotype.Component;

@Component
public class ByteDanceJobAdapter implements JobSourceAdapter {
    private final ByteDanceJobClient client;
    public ByteDanceJobAdapter(ByteDanceJobClient client) { this.client = client; }
    @Override public String getSource() { return "BYTEDANCE"; }
    @Override public boolean supports(String source) { return getSource().equalsIgnoreCase(source); }

    @Override
    public List<NormalizedJob> searchJobs(JobSearchCondition condition) {
        var response = client.search(condition);
        return response.data().jobPostList().stream().map(job -> NormalizedJob.builder()
                .source(getSource()).sourceJobId(job.id()).company("字节跳动").jobName(job.title())
                .city(city(job)).recruitmentType("SOCIAL")
                .sourceUrl("https://jobs.bytedance.com/experienced/position/" + job.id() + "/detail")
                .rawContent(content(job)).build()).toList();
    }

    private String city(ByteDanceJobResponse.JobPost job) {
        var names = new LinkedHashSet<String>();
        add(names, job.cityList()); add(names, job.cityInfoList());
        if (names.isEmpty() && job.cityInfo() != null && job.cityInfo().displayName() != null) names.add(job.cityInfo().displayName());
        return String.join(" / ", names);
    }

    private void add(LinkedHashSet<String> names, List<ByteDanceJobResponse.NamedValue> values) {
        if (values == null) return;
        values.stream().map(ByteDanceJobResponse.NamedValue::displayName)
                .filter(value -> value != null && !value.isBlank()).forEach(names::add);
    }

    private String content(ByteDanceJobResponse.JobPost job) {
        var parts = new ArrayList<String>();
        parts.add("岗位名称：" + job.title());
        if (job.description() != null && !job.description().isBlank()) parts.add("岗位职责：\n" + job.description());
        if (job.requirement() != null && !job.requirement().isBlank()) parts.add("岗位要求：\n" + job.requirement());
        return String.join("\n\n", parts);
    }
}
