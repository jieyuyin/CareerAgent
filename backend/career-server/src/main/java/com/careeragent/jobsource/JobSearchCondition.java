package com.careeragent.jobsource;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import java.util.List;
import lombok.Builder;
import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class JobSearchCondition {
    @NotNull @Size(max = 100) private String keyword;
    private List<String> cities;
    @Min(1) private Integer page;
    @Min(1) @Max(50) private Integer size;
}
