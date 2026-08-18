package com.careeragent.service;

import com.careeragent.agent.llm.LLMAdapter;
import com.careeragent.agent.prompt.ResumeDiagnosisPrompt;
import com.careeragent.agent.prompt.ResumeParsePrompt;
import com.careeragent.agent.structured.ResumeDiagnosisOutput;
import com.careeragent.agent.structured.ResumeParseOutput;
import com.careeragent.exception.BusinessException;
import com.careeragent.vo.ResumeUploadDraftVO;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.Map;
import java.util.UUID;
import lombok.RequiredArgsConstructor;
import org.apache.pdfbox.Loader;
import org.apache.pdfbox.text.PDFTextStripper;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
@RequiredArgsConstructor
public class ResumeIntelligenceService {
    private final LLMAdapter llm;
    private final ResumeService resumeService;
    @Value("${career.storage.resume-dir:./data/resumes}") private String resumeDirectory;

    public ResumeUploadDraftVO uploadAndParse(MultipartFile file) {
        validate(file);
        try {
            var extension = extension(file.getOriginalFilename());
            var directory = Path.of(resumeDirectory).toAbsolutePath().normalize();
            Files.createDirectories(directory);
            var stored = directory.resolve(UUID.randomUUID() + "." + extension);
            try (var input = file.getInputStream()) { Files.copy(input, stored, StandardCopyOption.REPLACE_EXISTING); }
            var text = extract(stored, extension);
            if (text.isBlank()) throw new BusinessException(40051, "没有从文件中提取到可解析的文字");
            var parsed = parse(text);
            return new ResumeUploadDraftVO(stored.toString(), safeName(file.getOriginalFilename()), file.getContentType(), parsed);
        } catch (BusinessException exception) { throw exception; }
        catch (Exception exception) { throw new BusinessException(50051, "简历文件处理失败：" + exception.getMessage()); }
    }

    public ResumeParseOutput parse(String text) {
        return llm.structuredOutput(ResumeParsePrompt.TEXT, Map.of("text", text), ResumeParseOutput.class);
    }

    public ResumeDiagnosisOutput diagnose(Long resumeId) {
        return llm.structuredOutput(ResumeDiagnosisPrompt.TEXT, Map.of("resume", resumeService.get(resumeId)), ResumeDiagnosisOutput.class);
    }

    private String extract(Path path, String extension) throws Exception {
        if ("pdf".equals(extension)) {
            try (var document = Loader.loadPDF(path.toFile())) { return new PDFTextStripper().getText(document); }
        }
        try (InputStream input = Files.newInputStream(path); var document = new XWPFDocument(input)) {
            return document.getParagraphs().stream().map(p -> p.getText()).reduce("", (a, b) -> a + "\n" + b);
        }
    }

    private void validate(MultipartFile file) {
        if (file == null || file.isEmpty()) throw new BusinessException(40052, "请选择 PDF 或 DOCX 简历");
        var extension = extension(file.getOriginalFilename());
        if (!"pdf".equals(extension) && !"docx".equals(extension)) throw new BusinessException(40053, "只支持 PDF 和 DOCX 文件");
        if (file.getSize() > 10 * 1024 * 1024) throw new BusinessException(40054, "简历文件不能超过 10MB");
    }

    private String extension(String name) {
        if (name == null || !name.contains(".")) return "";
        return name.substring(name.lastIndexOf('.') + 1).toLowerCase();
    }
    private String safeName(String name) { return name == null ? "resume" : Path.of(name).getFileName().toString(); }
}
