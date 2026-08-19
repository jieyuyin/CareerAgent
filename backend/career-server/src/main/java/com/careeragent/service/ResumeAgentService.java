package com.careeragent.service;

import com.careeragent.agent.llm.LLMAdapter;
import com.careeragent.agent.prompt.ResumeGeneratePrompt;
import com.careeragent.agent.prompt.ResumePolishPrompt;
import com.careeragent.agent.structured.ResumeGenerateOutput;
import com.careeragent.agent.structured.ResumePolishOutput;
import com.careeragent.domain.entity.ResumeVersion;
import com.careeragent.domain.enums.ResumeVersionStatus;
import com.careeragent.dto.ResumeGenerateRequest;
import com.careeragent.dto.ResumePolishRequest;
import com.careeragent.exception.BusinessException;
import com.careeragent.mapper.ResumeVersionMapper;
import com.careeragent.security.CurrentUserProvider;
import com.careeragent.vo.ResumeVersionVO;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.*;
import lombok.RequiredArgsConstructor;
import org.apache.fontbox.ttf.TrueTypeCollection;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.font.PDFont;
import org.apache.pdfbox.pdmodel.font.PDType0Font;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service @RequiredArgsConstructor
public class ResumeAgentService {
    private final LLMAdapter llm;
    private final ResumeService resumeService;
    private final JobDescriptionService jobService;
    private final ResumeVersionService versionService;
    private final ResumeVersionMapper versionMapper;
    private final CurrentUserProvider currentUser;
    @Value("${career.storage.resume-pdf-dir:./data/resume-pdfs}") private String pdfDirectory;
    @Value("${career.pdf.font-path:}") private String configuredFont;

    public ResumePolishOutput polish(ResumePolishRequest request) {
        return llm.structuredOutput(ResumePolishPrompt.TEXT, request, ResumePolishOutput.class);
    }

    @Transactional
    public ResumeVersionVO generate(ResumeGenerateRequest request) {
        var master = resumeService.currentEntity();
        if (master == null) throw new BusinessException(40061, "请先创建 Master Resume");
        String jd = Objects.toString(request.jdContent(), "").trim(), company = "", jobName = "目标岗位";
        Long jobId = request.jobId();
        if (jobId != null) {
            var job = jobService.get(jobId);
            jd = job.getRawContent(); company = job.getCompany(); jobName = job.getJobName();
        }
        if (jd.isBlank()) throw new BusinessException(40062, "请选择目标岗位或输入 JD");
        var output = llm.structuredOutput(ResumeGeneratePrompt.TEXT,
                Map.of("resume", master, "jd", jd, "company", company, "jobName", jobName), ResumeGenerateOutput.class);
        var entity = new ResumeVersion();
        entity.setUserId(currentUser.getCurrentUserId()); entity.setResumeId(master.getId()); entity.setJobDescriptionId(jobId);
        entity.setVersionName(blankDefault(output.versionName(), (company + " " + jobName + "版").trim()));
        entity.setTargetCompany(company); entity.setTargetJobName(jobName); entity.setVersionType("CUSTOM");
        entity.setContentMarkdown(output.markdown()); entity.setHtmlContent(toHtml(output.markdown()));
        var masterSnapshot = new LinkedHashMap<String, Object>();
        masterSnapshot.put("resumeId", master.getId()); masterSnapshot.put("name", master.getName());
        masterSnapshot.put("fullName", master.getFullName()); masterSnapshot.put("phone", master.getPhone());
        masterSnapshot.put("email", master.getEmail()); masterSnapshot.put("location", master.getLocation());
        masterSnapshot.put("targetRole", master.getTargetRole()); masterSnapshot.put("education", master.getEducation());
        masterSnapshot.put("experiences", master.getExperiences()); masterSnapshot.put("projects", master.getProjects());
        masterSnapshot.put("skills", master.getSkills());
        entity.setSnapshotData(Map.of("masterResume", masterSnapshot, "matchedRequirements", output.matchedRequirements(), "missingEvidence", output.missingEvidence()));
        entity.setChangeSummary(output.changeSummary()); entity.setStatus(ResumeVersionStatus.DRAFT);
        versionMapper.insert(entity);
        return ResumeVersionVO.from(entity);
    }

    public List<ResumeVersionVO> versions() { return versionService.list(null, null); }

    public byte[] exportMasterPdf() {
        var master = resumeService.currentEntity();
        if (master == null) throw new BusinessException(40061, "请先创建 Master Resume");
        try { return renderPdf(masterMarkdown(master)); }
        catch (BusinessException e) { throw e; }
        catch (Exception e) { throw new BusinessException(50061, "PDF 生成失败：" + e.getMessage()); }
    }

    @Transactional
    public byte[] exportPdf(Long id) {
        var version = versionService.owned(id);
        try {
            var bytes = renderPdf(version.getContentMarkdown());
            var dir = Path.of(pdfDirectory).toAbsolutePath().normalize(); Files.createDirectories(dir);
            var path = dir.resolve("resume-version-" + id + ".pdf"); Files.write(path, bytes);
            version.setPdfUrl(path.toString()); versionMapper.updateById(version);
            return bytes;
        } catch (BusinessException e) { throw e; }
        catch (Exception e) { throw new BusinessException(50061, "PDF 生成失败：" + e.getMessage()); }
    }

    private byte[] renderPdf(String markdown) throws Exception {
        if (markdown == null || markdown.isBlank()) throw new BusinessException(40063, "当前简历版本没有可导出的内容");
        try (var document = new PDDocument(); var fontResource = loadFont(document)) {
            var font = fontResource.font; var page = new PDPage(PDRectangle.A4); document.addPage(page);
            var stream = new PDPageContentStream(document, page); float y = 800;
            for (var raw : markdown.lines().toList()) {
                var line = raw.replace('\t', ' ').replaceAll("[\\p{Cc}&&[^\\n]]", "")
                        .replaceFirst("^#{1,3}\\s*", "").replace("**", "").replaceAll(" {2,}", " ").trim();
                if (line.isBlank()) { y -= 8; continue; }
                var size = raw.startsWith("# ") ? 20f : raw.startsWith("## ") ? 13f : raw.startsWith("### ") ? 11f : 9.5f;
                for (var wrapped : wrap(font, line, size, 495)) {
                    if (y < 50) { stream.close(); page = new PDPage(PDRectangle.A4); document.addPage(page); stream = new PDPageContentStream(document, page); y = 800; }
                    stream.beginText(); stream.setFont(font, size); stream.newLineAtOffset(50, y); stream.showText(wrapped); stream.endText(); y -= size + 5;
                }
                if (raw.startsWith("## ")) y -= 4;
            }
            stream.close(); var output = new java.io.ByteArrayOutputStream(); document.save(output); return output.toByteArray();
        }
    }

    private FontResource loadFont(PDDocument document) throws Exception {
        var candidates = new ArrayList<String>();
        if (!configuredFont.isBlank()) candidates.add(configuredFont);
        candidates.addAll(List.of("/System/Library/Fonts/STHeiti Medium.ttc", "/System/Library/Fonts/PingFang.ttc",
                "/usr/share/fonts/opentype/noto/NotoSansCJK-Regular.ttc", "/usr/share/fonts/truetype/wqy/wqy-zenhei.ttc"));
        for (var value : candidates) {
            var path = Path.of(value); if (!Files.exists(path)) continue;
            if (value.endsWith(".ttf")) return new FontResource(PDType0Font.load(document, path.toFile()), null);
            var collection = new TrueTypeCollection(path.toFile()); var selected = new org.apache.fontbox.ttf.TrueTypeFont[1];
            collection.processAllFonts(font -> { if (selected[0] == null) selected[0] = font; });
            if (selected[0] != null) return new FontResource(PDType0Font.load(document, selected[0], true), collection);
            collection.close();
        }
        throw new BusinessException(50062, "未找到中文字体，请通过 CAREER_PDF_FONT_PATH 配置 TTF/TTC 字体");
    }

    private List<String> wrap(PDFont font, String text, float size, float width) throws Exception {
        var result = new ArrayList<String>(); var line = new StringBuilder();
        for (int offset = 0; offset < text.length();) {
            int code = text.codePointAt(offset); var next = new String(Character.toChars(code));
            if (!line.isEmpty() && font.getStringWidth(line + next) / 1000 * size > width) { result.add(line.toString()); line.setLength(0); }
            line.append(next); offset += Character.charCount(code);
        }
        if (!line.isEmpty()) result.add(line.toString()); return result;
    }

    private String toHtml(String markdown) {
        var html = new StringBuilder("<!doctype html><html><meta charset=\"utf-8\"><style>@page{size:A4;margin:16mm}body{font-family:sans-serif;color:#171714;line-height:1.55}h1{font-size:26px}h2{font-size:16px;border-bottom:1px solid #bbb;padding-bottom:4px}h3{font-size:13px}</style><body>");
        for (var line : Objects.toString(markdown, "").lines().toList()) {
            var safe = escape(line.replaceFirst("^#{1,3}\\s*", ""));
            if (line.startsWith("# ")) html.append("<h1>").append(safe).append("</h1>");
            else if (line.startsWith("## ")) html.append("<h2>").append(safe).append("</h2>");
            else if (line.startsWith("### ")) html.append("<h3>").append(safe).append("</h3>");
            else if (!safe.isBlank()) html.append("<p>").append(safe).append("</p>");
        }
        return html.append("</body></html>").toString();
    }
    private String masterMarkdown(com.careeragent.domain.entity.Resume resume) {
        var md = new StringBuilder("# ").append(resume.getFullName()).append("\n\n")
                .append(String.join(" · ", List.of(Objects.toString(resume.getPhone(), ""), Objects.toString(resume.getEmail(), ""), Objects.toString(resume.getLocation(), "")).stream().filter(s -> !s.isBlank()).toList()))
                .append("\n\n## 求职方向\n").append(Objects.toString(resume.getTargetRole(), "")).append("\n");
        appendMarkdownItems(md, "教育经历", resume.getEducation(), "school");
        appendMarkdownItems(md, "实习经历", resume.getExperiences(), "company");
        appendMarkdownItems(md, "项目经历", resume.getProjects(), "name");
        return md.append("\n## 技能\n").append(String.join(" · ", Optional.ofNullable(resume.getSkills()).orElse(List.of()))).toString();
    }
    private void appendMarkdownItems(StringBuilder md, String title, List<Map<String,Object>> items, String key) {
        md.append("\n## ").append(title).append("\n");
        for (var item : Optional.ofNullable(items).orElse(List.of())) md.append("### ").append(Objects.toString(item.get(key), "待确认")).append("\n")
                .append(Objects.toString(item.get("description"), "")).append("\n");
    }
    private String escape(String value) { return value.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;"); }
    private String blankDefault(String value, String fallback) { return value == null || value.isBlank() ? fallback : value; }
    private static final class FontResource implements AutoCloseable { final PDFont font; final AutoCloseable resource; FontResource(PDFont f, AutoCloseable r){font=f;resource=r;} public void close() throws Exception {if(resource!=null)resource.close();} }
}
