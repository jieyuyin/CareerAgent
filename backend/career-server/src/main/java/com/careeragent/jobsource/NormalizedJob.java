package com.careeragent.jobsource;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class NormalizedJob {
    private String source;
    private String sourceJobId;
    private String company;
    private String jobName;
    private String city;
    private String recruitmentType;
    private String sourceUrl;
    private String rawContent;
}
