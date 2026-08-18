package com.careeragent.jobsource.bytedance;

import com.careeragent.exception.BusinessException;
import com.careeragent.jobsource.JobSearchCondition;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.Duration;
import java.util.LinkedHashMap;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class ByteDanceJobClient {
    private final ObjectMapper objectMapper;
    private final ByteDanceLocationService locationService;
    @Value("${career.job-source.bytedance.search-url:https://jobs.bytedance.com/api/v1/search/job/posts}")
    private String searchUrl;
    @Value("${career.job-source.bytedance.user-agent:Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36}")
    private String userAgent;
    @Value("${career.job-source.bytedance.campus-subject-id:7649336829398468869}")
    private String campusSubjectId;
    private final HttpClient httpClient = HttpClient.newBuilder()
            .connectTimeout(Duration.ofSeconds(8)).followRedirects(HttpClient.Redirect.NORMAL).build();

    public ByteDanceJobResponse search(JobSearchCondition condition) {
        return search(condition, Portal.SOCIAL);
    }

    public ByteDanceJobResponse searchCampus(JobSearchCondition condition) {
        return search(condition, Portal.CAMPUS);
    }

    private ByteDanceJobResponse search(JobSearchCondition condition, Portal portal) {
        int page = condition.getPage() == null ? 1 : condition.getPage();
        int size = condition.getSize() == null ? 20 : condition.getSize();
        int offset = (page - 1) * size;
        var body = buildRequestBody(condition, portal);
        try {
            var uri = URI.create(searchUrl + "?keyword=" + encode(condition.getKeyword()) + "&limit=" + size
                    + "&offset=" + offset + "&portal_type=" + portal.portalType + "&portal_entrance=1");
            var request = HttpRequest.newBuilder(uri).timeout(Duration.ofSeconds(20))
                    .header("Accept", "application/json, text/plain, */*")
                    .header("Content-Type", "application/json")
                    .header("User-Agent", userAgent)
                    .header("Portal-Channel", portal.channel).header("Portal-Platform", "pc")
                    .header("website-path", portal.websitePath)
                    .POST(HttpRequest.BodyPublishers.ofString(objectMapper.writeValueAsString(body))).build();
            var response = httpClient.send(request, HttpResponse.BodyHandlers.ofString());
            if (response.statusCode() < 200 || response.statusCode() >= 300)
                throw new BusinessException(50241, "字节招聘接口返回 HTTP " + response.statusCode());
            var result = objectMapper.readValue(response.body(), ByteDanceJobResponse.class);
            if (result.code() != 0 || result.data() == null || result.data().jobPostList() == null)
                throw new BusinessException(50242, "字节招聘接口响应格式变化或返回失败：" + result.message());
            return result;
        } catch (BusinessException exception) {
            throw exception;
        } catch (java.net.http.HttpTimeoutException exception) {
            throw new BusinessException(50441, "字节招聘接口请求超时");
        } catch (InterruptedException exception) {
            Thread.currentThread().interrupt();
            throw new BusinessException(50243, "字节招聘接口请求被中断");
        } catch (Exception exception) {
            throw new BusinessException(50244, "字节招聘接口调用失败：" + exception.getMessage());
        }
    }

    LinkedHashMap<String, Object> buildRequestBody(JobSearchCondition condition) {
        return buildRequestBody(condition, Portal.SOCIAL);
    }

    LinkedHashMap<String, Object> buildCampusRequestBody(JobSearchCondition condition) {
        return buildRequestBody(condition, Portal.CAMPUS);
    }

    private LinkedHashMap<String, Object> buildRequestBody(JobSearchCondition condition, Portal portal) {
        int page = condition.getPage() == null ? 1 : condition.getPage();
        int size = condition.getSize() == null ? 20 : condition.getSize();
        int offset = (page - 1) * size;
        var body = new LinkedHashMap<String, Object>();
        body.put("keyword", condition.getKeyword()); body.put("limit", size); body.put("offset", offset);
        body.put("job_category_id_list", List.of()); body.put("tag_id_list", List.of());
        body.put("location_code_list", locationService.resolveCodes(condition.getCities()));
        body.put("subject_id_list", portal == Portal.CAMPUS ? List.of(campusSubjectId) : List.of());
        body.put("recruitment_id_list", List.of());
        body.put("job_function_id_list", List.of()); body.put("storefront_id_list", List.of());
        body.put("portal_type", portal.portalType); body.put("portal_entrance", 1);
        return body;
    }

    private String encode(String value) { return java.net.URLEncoder.encode(value, java.nio.charset.StandardCharsets.UTF_8); }
    void setCampusSubjectId(String campusSubjectId) { this.campusSubjectId = campusSubjectId; }

    private enum Portal {
        SOCIAL(2, "office", "society"), CAMPUS(3, "campus", "campus");
        private final int portalType; private final String channel; private final String websitePath;
        Portal(int portalType, String channel, String websitePath) {
            this.portalType = portalType; this.channel = channel; this.websitePath = websitePath;
        }
    }
}
