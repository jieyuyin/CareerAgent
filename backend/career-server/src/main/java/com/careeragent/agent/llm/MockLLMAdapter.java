package com.careeragent.agent.llm;

import com.careeragent.agent.structured.*;
import com.careeragent.domain.entity.*;
import com.careeragent.domain.enums.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.UUID;
import java.util.regex.Pattern;
public class MockLLMAdapter extends AbstractJsonStructuredOutputAdapter {
    private static final Pattern JOB_ID = Pattern.compile("岗位\\s*(?:ID)?\\s*[：:#]?\\s*(\\d+)", Pattern.CASE_INSENSITIVE);
    private static final Pattern RESUME_ID = Pattern.compile("简历\\s*(?:ID)?\\s*[：:#]?\\s*(\\d+)", Pattern.CASE_INSENSITIVE);
    private static final Pattern VERSION_ID = Pattern.compile("简历版本\\s*(?:ID)?\\s*[：:#]?\\s*(\\d+)", Pattern.CASE_INSENSITIVE);
    private static final Pattern APPLICATION_ID = Pattern.compile("投递\\s*(?:ID)?\\s*[：:#]?\\s*(\\d+)", Pattern.CASE_INSENSITIVE);

    public MockLLMAdapter(ObjectMapper objectMapper) { super(objectMapper); }

    @Override
    public AgentModelResponse chat(AgentModelRequest request) {
        var last = request.messages().get(request.messages().size() - 1);
        if ("TOOL".equals(last.role())) {
            var userText = request.messages().stream().filter(m -> "USER".equals(m.role())).reduce((a, b) -> b).map(AgentModelMessage::content).orElse("");
            var toolName = Objects.toString(last.metadata().get("toolName"), "");
            if (isMatchRequest(userText)) {
                if ("get_job_detail".equals(toolName)) return call("list_resumes", Map.of());
                if ("list_resumes".equals(toolName)) return call("match_resume_to_job", Map.of("jobDescriptionId", jobId(request), "resumeId", defaultResumeId(last.content())));
            }
            return AgentModelResponse.message("工具执行完成：" + last.content());
        }
        var text = last.content();
        if (text.contains("分析岗位") && match(JOB_ID, text) != null)
            return call("analyze_job_description", Map.of("jobDescriptionId", match(JOB_ID, text)));
        if (isMatchRequest(text) && match(JOB_ID, text) != null)
            return call("get_job_detail", Map.of("jobId", match(JOB_ID, text)));
        if (text.contains("优化") && (text.contains("经历") || text.contains("项目"))) {
            return call("rewrite_experience", Map.of("jobDescriptionId", jobId(request), "resumeId", 1L,
                    "itemType", text.contains("项目") ? "PROJECT" : "EXPERIENCE", "itemId", text.contains("项目") ? "project-1" : "exp-1"));
        }
        if ((text.contains("加入投递") || text.contains("创建投递")) && match(JOB_ID, text) != null && match(VERSION_ID, text) != null) {
            return call("create_application", Map.of(
                    "jobDescriptionId", match(JOB_ID, text),
                    "resumeVersionId", match(VERSION_ID, text),
                    "channel", "OFFICIAL_SITE"));
        }
        if ((text.contains("投递详情") || text.contains("查看投递")) && match(APPLICATION_ID, text) != null) {
            return call("get_application_detail", Map.of("applicationId", match(APPLICATION_ID, text)));
        }
        if (text.contains("简历") && match(RESUME_ID, text) != null && !text.contains("简历版本")) {
            return call("get_resume_detail", Map.of("resumeId", match(RESUME_ID, text)));
        }
        if ((text.contains("岗位详情") || text.contains("看看岗位") || text.contains("查看岗位")) && match(JOB_ID, text) != null) {
            return call("get_job_detail", Map.of("jobId", match(JOB_ID, text)));
        }
        if (text.contains("简历")) return call("list_resumes", Map.of());
        if (text.contains("岗位")) return call("list_jobs", Map.of());
        return AgentModelResponse.message("MockLLM 已收到消息。你可以让我查看岗位、简历或创建投递。");
    }

    private AgentModelResponse call(String name, Map<String, Object> arguments) {
        return AgentModelResponse.toolCall(new ToolCall(UUID.randomUUID().toString(), name, arguments));
    }

    private Long match(Pattern pattern, String text) {
        var matcher = pattern.matcher(text);
        return matcher.find() ? Long.valueOf(matcher.group(1)) : null;
    }

    private boolean isMatchRequest(String text) { return text.contains("匹不匹配") || text.contains("匹配度") || text.contains("匹配简历"); }
    private Long jobId(AgentModelRequest request) {
        return request.messages().stream().filter(m -> "USER".equals(m.role())).map(AgentModelMessage::content).map(t -> match(JOB_ID, t)).filter(Objects::nonNull).reduce((a,b)->b).orElse(1L);
    }
    private Long defaultResumeId(String toolJson) {
        try {
            var items=objectMapper.readTree(toolJson).path("data");
            if(items.isArray()) for(var item:items) if(item.path("isDefault").asBoolean(false)) return item.path("id").asLong();
            return items.isArray()&&items.size()>0?items.get(0).path("id").asLong():1L;
        } catch(Exception ignored){return 1L;}
    }

    @Override
    protected String generateStructuredJson(String prompt, Object input, Class<?> responseType, int attempt) throws Exception {
        var data = objectMapper.convertValue(input, Map.class);
        Object output;
        if (responseType == JobAnalysisOutput.class) output = analyze(data);
        else if (responseType == ResumeMatchOutput.class) output = matchResume(data);
        else if (responseType == ExperienceRewriteOutput.class) output = rewrite(data);
        else if (responseType == ResumeParseOutput.class) output = parseResume(data);
        else if (responseType == ResumeDiagnosisOutput.class) output = diagnoseResume(data);
        else throw new IllegalArgumentException("Unsupported mock structured type: " + responseType.getName());
        return objectMapper.writeValueAsString(output);
    }

    private JobAnalysisOutput analyze(Map<String, Object> data) {
        var raw = Objects.toString(data.get("rawContent"), "");
        var jobName = Objects.toString(data.get("jobName"), "");
        var required = new LinkedHashSet<String>();
        for (var skill : List.of("Java", "Spring Boot", "React", "PostgreSQL", "Redis", "Agent", "Tool Calling", "LLM"))
            if (raw.toLowerCase().contains(skill.toLowerCase())) required.add(skill);
        var responsibilities = raw.isBlank() ? List.<String>of() : Arrays.stream(raw.split("[。；;\\n]")).map(String::trim).filter(s -> !s.isBlank()).limit(8).toList();
        var keywords = new ArrayList<>(required);
        return new JobAnalysisOutput(jobName, responsibilities, List.copyOf(required), List.of(), keywords,
                raw.contains("本科") ? "本科及以上" : "", raw.contains("经验") ? "以原始 JD 描述为准" : "",
                keywords.stream().limit(5).toList(), keywords.stream().map(s -> s + " 基础与项目实践").limit(5).toList());
    }

    @SuppressWarnings("unchecked")
    private ResumeMatchOutput matchResume(Map<String, Object> data) {
        var job = objectMapper.convertValue(data.get("job"), JobDescription.class);
        var resume = objectMapper.convertValue(data.get("resume"), Resume.class);
        var resumeSkills = new LinkedHashSet<>(Optional.ofNullable(resume.getSkills()).orElse(List.of()));
        var matched = new ArrayList<String>(); var missing = new ArrayList<String>(); var evidence = new ArrayList<MatchEvidence>();
        for (var requirement : Optional.ofNullable(job.getRequiredSkills()).orElse(List.of())) {
            var found = resumeSkills.stream().filter(s -> s.equalsIgnoreCase(requirement)).findFirst();
            var itemEvidence = findResumeEvidence(resume, requirement);
            if (found.isPresent()) { matched.add(requirement); evidence.add(new MatchEvidence(requirement, "SKILLS", "skills", found.get(), MatchEvidenceResult.MATCHED, "简历技能栏存在直接证据")); }
            else if (itemEvidence != null) { matched.add(requirement); evidence.add(itemEvidence); }
            else { missing.add(requirement); evidence.add(new MatchEvidence(requirement, "NONE", "", "", MatchEvidenceResult.MISSING, "简历中没有找到可引用证据")); }
        }
        var total = matched.size() + missing.size(); var score = total == 0 ? 50 : Math.round(matched.size() * 100f / total);
        var changes = missing.stream().map(s -> "如有真实经历，请补充与 “" + s + "” 相关的具体证据").toList();
        return new ResumeMatchOutput(score, matched, missing, List.of(), List.of(), changes, evidence);
    }

    private MatchEvidence findResumeEvidence(Resume resume, String requirement) {
        for (var section : List.of(Map.entry("EXPERIENCE", Optional.ofNullable(resume.getExperiences()).orElse(List.of())),
                Map.entry("PROJECT", Optional.ofNullable(resume.getProjects()).orElse(List.of())))) {
            for (var item : section.getValue()) {
                var content = item.values().stream().map(Object::toString).reduce("", (a,b) -> a + " " + b);
                if (content.toLowerCase().contains(requirement.toLowerCase()))
                    return new MatchEvidence(requirement, section.getKey(), Objects.toString(item.get("id"), ""), content.trim(), MatchEvidenceResult.MATCHED, "简历条目存在直接文字证据");
            }
        }
        return null;
    }

    private ExperienceRewriteOutput rewrite(Map<String, Object> data) {
        var type = RewriteItemType.valueOf(data.get("itemType").toString());
        var id = data.get("itemId").toString(); var original = Objects.toString(data.get("originalText"), "");
        var requirements = objectMapper.convertValue(data.get("jobRequirements"), List.class);
        var focus = requirements.isEmpty() ? "目标岗位能力" : requirements.get(0).toString();
        var suggested = original.contains("参与") ? original + "；围绕“" + focus + "”补充本人实际承担的技术动作与可核验证据（待补充）"
                : "围绕“" + focus + "”，" + original + "；结果证据待补充";
        return new ExperienceRewriteOutput(type, id, original, suggested, "增强与岗位要求的对应关系，同时保留原始职责边界",
                requirements.stream().map(Object::toString).limit(3).toList(), List.of("请确认可量化结果及个人负责边界"),
                original.contains("参与") ? List.of("保留“参与”表述，未升级为主导") : List.of("未生成无依据的指标"));
    }

    private ResumeParseOutput parseResume(Map<String, Object> data) {
        var text = Objects.toString(data.get("text"), "").replace("\r\n", "\n").replace('\r', '\n');
        var emailMatcher = Pattern.compile("[\\w.+-]+@[\\w.-]+\\.[A-Za-z]{2,}").matcher(text);
        var phoneMatcher = Pattern.compile("(?<!\\d)1[3-9]\\d{9}(?!\\d)").matcher(text);
        var skills = List.of("Java", "Spring Boot", "React", "PostgreSQL", "Redis", "AI Agent", "Tool Calling", "Python")
                .stream().filter(skill -> text.toLowerCase().contains(skill.toLowerCase())).toList();
        var educationText = section(text, "教育经历", "教育背景", "教育");
        var experienceText = section(text, "实习经历", "工作经历", "工作经验", "实习经验");
        var projectText = section(text, "项目经历", "项目经验", "项目");
        var education = educationText.isBlank() ? List.<Map<String, Object>>of()
                : List.of(item("school", firstLine(educationText), "major", "待确认", "degree", "待确认", "period", findPeriod(educationText), "description", educationText));
        var experiences = experienceText.isBlank() ? List.<Map<String, Object>>of()
                : List.of(item("company", firstLine(experienceText), "position", "待确认", "period", findPeriod(experienceText), "description", experienceText));
        var projects = projectText.isBlank() ? List.<Map<String, Object>>of()
                : List.of(item("name", firstLine(projectText), "role", "待确认", "techStack", String.join("、", skills), "description", projectText));
        var confirmations = new ArrayList<String>();
        confirmations.add("姓名"); confirmations.add("求职方向");
        if (!education.isEmpty()) confirmations.add("教育经历中的专业、学历和时间");
        if (!experiences.isEmpty()) confirmations.add("实习经历中的公司、职位和时间");
        if (!projects.isEmpty()) confirmations.add("项目名称、角色和技术栈");
        return new ResumeParseOutput("待确认", phoneMatcher.find() ? phoneMatcher.group() : "",
                emailMatcher.find() ? emailMatcher.group() : "", "待确认", education, experiences, projects,
                skills, confirmations);
    }

    private String section(String text, String... aliases) {
        var aliasPattern = Arrays.stream(aliases).map(Pattern::quote).reduce((a, b) -> a + "|" + b).orElse("");
        var allHeadings = "基本信息|个人信息|教育经历|教育背景|教育|实习经历|实习经验|工作经历|工作经验|项目经历|项目经验|项目|专业技能|技能清单|技能|自我评价|获奖经历|证书";
        var pattern = Pattern.compile("(?im)^\\s*(?:" + aliasPattern + ")\\s*[:：]?\\s*(.*?)\\s*$\\n?([\\s\\S]*?)(?=^\\s*(?:" + allHeadings + ")\\s*[:：]?|\\z)");
        var matcher = pattern.matcher(text);
        if (!matcher.find()) return "";
        return (matcher.group(1) + "\n" + matcher.group(2)).trim();
    }

    private String firstLine(String text) {
        return text.lines().map(String::trim).filter(line -> !line.isBlank()).findFirst().orElse("待确认");
    }

    private String findPeriod(String text) {
        var matcher = Pattern.compile("(?:19|20)\\d{2}[./年-]?\\d{0,2}\\s*(?:[-—~至到]|--)+\\s*(?:(?:19|20)\\d{2}[./年-]?\\d{0,2}|至今)").matcher(text);
        return matcher.find() ? matcher.group() : "待确认";
    }

    private Map<String, Object> item(Object... values) {
        var result = new LinkedHashMap<String, Object>();
        for (int index = 0; index < values.length; index += 2) result.put(values[index].toString(), values[index + 1]);
        return result;
    }

    private ResumeDiagnosisOutput diagnoseResume(Map<String, Object> data) {
        var resume = objectMapper.convertValue(data.get("resume"), Resume.class);
        var strengths = new ArrayList<String>();
        if (resume.getSkills() != null && !resume.getSkills().isEmpty()) strengths.add("技能方向清晰，已列出 " + resume.getSkills().size() + " 项能力");
        if (resume.getProjects() != null && !resume.getProjects().isEmpty()) strengths.add("具备可用于岗位匹配的项目经历");
        var improvements = new ArrayList<String>();
        if (resume.getExperiences() == null || resume.getExperiences().isEmpty()) improvements.add("实习或工作经历仍需补充");
        if (resume.getProjects() == null || resume.getProjects().isEmpty()) improvements.add("项目经历缺少可引用证据");
        return new ResumeDiagnosisOutput(strengths, improvements,
                List.of("描述个人负责边界、技术动作和可核验结果", "优先补充与目标岗位直接相关的证据"));
    }
}
