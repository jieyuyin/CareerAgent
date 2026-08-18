package com.careeragent.jobsource;

import java.util.List;

public interface JobSourceAdapter {
    String getSource();
    boolean supports(String source);
    List<NormalizedJob> searchJobs(JobSearchCondition condition);
}
