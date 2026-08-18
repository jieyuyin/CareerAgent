package com.careeragent.jobsource.bytedance;

import com.careeragent.exception.BusinessException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Service;

@Service
@ConfigurationProperties(prefix = "career.job-source.bytedance")
public class ByteDanceLocationService {
    private Map<String, String> locations = Map.of();

    public List<String> resolveCodes(List<String> cityNames) {
        if (cityNames == null || cityNames.isEmpty()) return List.of();
        var result = new ArrayList<String>();
        var missing = new ArrayList<String>();
        for (var city : cityNames) {
            var code = locations.get(city);
            if (code == null || code.isBlank()) missing.add(city); else result.add(code);
        }
        if (!missing.isEmpty()) throw new BusinessException(40041,
                "尚未配置该城市的字节招聘 location code：" + String.join("、", missing));
        return result;
    }

    public void setLocations(Map<String, String> locations) { this.locations = locations == null ? Map.of() : locations; }
}
