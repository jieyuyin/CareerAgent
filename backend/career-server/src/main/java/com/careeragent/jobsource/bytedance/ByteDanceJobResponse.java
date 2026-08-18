package com.careeragent.jobsource.bytedance;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import java.util.List;

@JsonIgnoreProperties(ignoreUnknown = true)
public record ByteDanceJobResponse(int code, String message, Data data) {
    @JsonIgnoreProperties(ignoreUnknown = true)
    public record Data(@JsonProperty("job_post_list") List<JobPost> jobPostList, Integer count, Integer total) {}

    @JsonIgnoreProperties(ignoreUnknown = true)
    public record JobPost(String id, String title, String description, String requirement,
                          @JsonProperty("city_info") NamedValue cityInfo,
                          @JsonProperty("city_info_list") List<NamedValue> cityInfoList,
                          @JsonProperty("city_list") List<NamedValue> cityList) {}

    @JsonIgnoreProperties(ignoreUnknown = true)
    public record NamedValue(String name, @JsonProperty("cn_name") String cnName) {
        public String displayName() { return name != null && !name.isBlank() ? name : cnName; }
    }
}
