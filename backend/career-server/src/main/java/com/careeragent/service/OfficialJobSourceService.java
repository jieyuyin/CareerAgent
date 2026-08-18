package com.careeragent.service;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.careeragent.domain.entity.JobDescription;
import com.careeragent.domain.entity.JobSourceConfig;
import com.careeragent.domain.enums.JobSource;
import com.careeragent.domain.enums.JobStatus;
import com.careeragent.domain.enums.OfficialSourceType;
import com.careeragent.domain.enums.RecruitmentType;
import com.careeragent.domain.enums.SourceSyncStatus;
import com.careeragent.dto.JobSourceConfigRequest;
import com.careeragent.exception.BusinessException;
import com.careeragent.exception.ResourceNotFoundException;
import com.careeragent.mapper.JobDescriptionMapper;
import com.careeragent.mapper.JobSourceConfigMapper;
import com.careeragent.security.CurrentUserProvider;
import com.careeragent.vo.JobSourceSyncResultVO;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.Duration;
import java.time.Instant;
import java.time.OffsetDateTime;
import java.time.ZoneOffset;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Service
@RequiredArgsConstructor
public class OfficialJobSourceService {
    private final JobSourceConfigMapper sourceMapper;
    private final JobDescriptionMapper jobMapper;
    private final CurrentUserProvider currentUser;
    private final ObjectMapper objectMapper;
    private final HttpClient httpClient = HttpClient.newBuilder()
            .connectTimeout(Duration.ofSeconds(10)).followRedirects(HttpClient.Redirect.NORMAL).build();

    public List<JobSourceConfig> list() {
        return sourceMapper.selectList(Wrappers.<JobSourceConfig>lambdaQuery()
                .eq(JobSourceConfig::getUserId, currentUser.getCurrentUserId())
                .orderByDesc(JobSourceConfig::getCreatedAt));
    }

    public JobSourceConfig get(Long id) { return owned(id); }

    public JobSourceConfig create(JobSourceConfigRequest request) {
        var source = apply(request, new JobSourceConfig());
        source.setUserId(currentUser.getCurrentUserId());
        source.setLastSyncStatus(SourceSyncStatus.NEVER);
        source.setLastDiscoveredCount(0);
        sourceMapper.insert(source);
        return source;
    }

    public JobSourceConfig update(Long id, JobSourceConfigRequest request) {
        var source = apply(request, owned(id));
        sourceMapper.updateById(source);
        return source;
    }

    public void delete(Long id) { sourceMapper.deleteById(owned(id)); }

    public JobSourceSyncResultVO sync(Long id) {
        var source = owned(id);
        if (!Boolean.TRUE.equals(source.getEnabled())) throw new BusinessException(40031, "官网源已停用，无法同步");
        validateEndpoint(source.getSourceType(), source.getApiUrl());
        source.setLastSyncStatus(SourceSyncStatus.RUNNING);
        source.setLastSyncAt(OffsetDateTime.now());
        source.setLastError(null);
        sourceMapper.updateById(source);
        try {
            var jobs = fetch(source);
            var result = persist(source, jobs);
            source.setLastSyncStatus(SourceSyncStatus.SUCCESS);
            source.setLastSuccessAt(OffsetDateTime.now());
            source.setLastDiscoveredCount(jobs.size());
            sourceMapper.updateById(source);
            return result;
        } catch (Exception exception) {
            source.setLastSyncStatus(SourceSyncStatus.FAILED);
            source.setLastError(limit(message(exception), 1000));
            sourceMapper.updateById(source);
            if (exception instanceof BusinessException businessException) throw businessException;
            throw new BusinessException(50231, "官网岗位同步失败：" + message(exception));
        }
    }

    private List<RemoteJob> fetch(JobSourceConfig source) throws Exception {
        var request = HttpRequest.newBuilder(URI.create(source.getApiUrl()))
                .timeout(Duration.ofSeconds(25)).header("Accept", "application/json")
                .header("User-Agent", "CareerAgent/0.1").GET().build();
        var response = httpClient.send(request, HttpResponse.BodyHandlers.ofString());
        if (response.statusCode() < 200 || response.statusCode() >= 300) {
            throw new BusinessException(50232, "官网接口返回 HTTP " + response.statusCode());
        }
        var root = objectMapper.readTree(response.body());
        return source.getSourceType() == OfficialSourceType.GREENHOUSE
                ? parseGreenhouse(root) : parseLever(root);
    }

    private List<RemoteJob> parseGreenhouse(JsonNode root) {
        var result = new ArrayList<RemoteJob>();
        for (var node : root.path("jobs")) {
            result.add(new RemoteJob(node.path("id").asText(), node.path("title").asText(),
                    node.path("location").path("name").asText(""), node.path("absolute_url").asText(""),
                    stripHtml(node.path("content").asText("")), parseIso(node.path("updated_at").asText(null)),
                    node.path("departments").isArray() && !node.path("departments").isEmpty()
                            ? node.path("departments").get(0).path("name").asText("") : ""));
        }
        return result;
    }

    private List<RemoteJob> parseLever(JsonNode root) {
        if (!root.isArray()) throw new BusinessException(50233, "Lever 接口响应格式不正确");
        var result = new ArrayList<RemoteJob>();
        for (var node : root) {
            var content = node.path("descriptionPlain").asText("");
            if (!StringUtils.hasText(content)) content = stripHtml(node.path("description").asText(""));
            var categories = node.path("categories");
            result.add(new RemoteJob(node.path("id").asText(), node.path("text").asText(),
                    categories.path("location").asText(""), node.path("hostedUrl").asText(""), content,
                    parseEpoch(node.path("createdAt").asLong(0)), categories.path("team").asText("")));
        }
        return result;
    }

    private JobSourceSyncResultVO persist(JobSourceConfig source, List<RemoteJob> remoteJobs) {
        int created = 0, updated = 0, skipped = 0;
        var seen = new HashSet<String>();
        for (var remote : remoteJobs) {
            if (!StringUtils.hasText(remote.externalId()) || !StringUtils.hasText(remote.title())) { skipped++; continue; }
            seen.add(remote.externalId());
            var entity = jobMapper.selectOne(Wrappers.<JobDescription>lambdaQuery()
                    .eq(JobDescription::getUserId, currentUser.getCurrentUserId())
                    .eq(JobDescription::getSourceConfigId, source.getId())
                    .eq(JobDescription::getSourceJobId, remote.externalId()));
            boolean isNew = entity == null;
            if (isNew) {
                entity = new JobDescription();
                entity.setUserId(currentUser.getCurrentUserId());
                entity.setSourceConfigId(source.getId());
                entity.setSourceJobId(remote.externalId());
            }
            entity.setCompany(source.getCompany());
            entity.setJobName(remote.title());
            entity.setDepartment(remote.department());
            entity.setCity(remote.location());
            entity.setRecruitmentType(inferRecruitment(remote.title() + " " + remote.content()));
            entity.setSource(JobSource.OFFICIAL_SITE);
            entity.setSourceUrl(StringUtils.hasText(remote.url()) ? remote.url() : source.getCareerUrl());
            entity.setRawContent(StringUtils.hasText(remote.content()) ? remote.content() : remote.title());
            entity.setStatus(JobStatus.OPEN);
            entity.setPublishedAt(remote.publishedAt());
            entity.setLastVerifiedAt(OffsetDateTime.now());
            if (isNew) { jobMapper.insert(entity); created++; } else { jobMapper.updateById(entity); updated++; }
        }
        var existing = jobMapper.selectList(Wrappers.<JobDescription>lambdaQuery()
                .eq(JobDescription::getUserId, currentUser.getCurrentUserId())
                .eq(JobDescription::getSourceConfigId, source.getId()));
        existing.stream().filter(job -> !seen.contains(job.getSourceJobId())).forEach(job -> {
            job.setStatus(JobStatus.CLOSED);
            job.setLastVerifiedAt(OffsetDateTime.now());
            jobMapper.updateById(job);
        });
        return new JobSourceSyncResultVO(remoteJobs.size(), created, updated, skipped);
    }

    private JobSourceConfig apply(JobSourceConfigRequest request, JobSourceConfig source) {
        validateEndpoint(request.sourceType(), request.apiUrl());
        source.setCompany(request.company().trim());
        source.setSourceType(request.sourceType());
        source.setApiUrl(request.apiUrl().trim());
        source.setCareerUrl(trim(request.careerUrl()));
        source.setEnabled(request.enabled() == null || request.enabled());
        return source;
    }

    private void validateEndpoint(OfficialSourceType type, String rawUrl) {
        URI uri;
        try {
            uri = URI.create(rawUrl);
        } catch (IllegalArgumentException exception) {
            throw new BusinessException(40033, "官网 API URL 必须是有效的 HTTPS 地址");
        }
        if (!"https".equalsIgnoreCase(uri.getScheme()) || uri.getHost() == null) {
            throw new BusinessException(40033, "官网 API URL 必须是有效的 HTTPS 地址");
        }
        var host = uri.getHost().toLowerCase(Locale.ROOT);
        boolean allowed = type == OfficialSourceType.GREENHOUSE
                ? host.equals("boards-api.greenhouse.io")
                : host.equals("api.lever.co");
        if (!allowed) throw new BusinessException(40032, "接口域名与官网源类型不匹配");
    }

    private JobSourceConfig owned(Long id) {
        var source = sourceMapper.selectOne(Wrappers.<JobSourceConfig>lambdaQuery()
                .eq(JobSourceConfig::getId, id).eq(JobSourceConfig::getUserId, currentUser.getCurrentUserId()));
        if (source == null) throw new ResourceNotFoundException("JobSourceConfig", id);
        return source;
    }

    private RecruitmentType inferRecruitment(String text) {
        var lower = text.toLowerCase(Locale.ROOT);
        if (lower.contains("intern") || lower.contains("实习")) return RecruitmentType.INTERNSHIP;
        if (lower.contains("campus") || lower.contains("graduate") || lower.contains("校招") || lower.contains("应届")) return RecruitmentType.CAMPUS;
        return RecruitmentType.SOCIAL;
    }

    private OffsetDateTime parseIso(String value) {
        try { return StringUtils.hasText(value) ? OffsetDateTime.parse(value) : null; }
        catch (Exception ignored) { return null; }
    }

    private OffsetDateTime parseEpoch(long value) {
        return value > 0 ? OffsetDateTime.ofInstant(Instant.ofEpochMilli(value), ZoneOffset.UTC) : null;
    }

    private String stripHtml(String value) {
        return value.replaceAll("(?is)<script.*?</script>|<style.*?</style>", " ")
                .replaceAll("<[^>]+>", " ").replace("&nbsp;", " ").replace("&amp;", "&")
                .replaceAll("\\s+", " ").trim();
    }

    private String trim(String value) { return value == null ? "" : value.trim(); }
    private String limit(String value, int max) { return value.length() <= max ? value : value.substring(0, max); }
    private String message(Exception exception) { return exception.getMessage() == null ? exception.getClass().getSimpleName() : exception.getMessage(); }
    private record RemoteJob(String externalId, String title, String location, String url, String content,
                             OffsetDateTime publishedAt, String department) {}
}
