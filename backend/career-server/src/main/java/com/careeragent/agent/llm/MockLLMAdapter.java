package com.careeragent.agent.llm;

import com.careeragent.agent.structured.*;
import com.careeragent.domain.entity.*;
import com.careeragent.domain.enums.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.UUID;
import java.util.regex.Pattern;
import java.util.function.Consumer;
public class MockLLMAdapter extends AbstractJsonStructuredOutputAdapter {
    private static final Pattern JOB_ID = Pattern.compile("岗位\\s*(?:ID)?\\s*[：:#]?\\s*(\\d+)", Pattern.CASE_INSENSITIVE);
    private static final Pattern RESUME_ID = Pattern.compile("简历\\s*(?:ID)?\\s*[：:#]?\\s*(\\d+)", Pattern.CASE_INSENSITIVE);
    private static final Pattern VERSION_ID = Pattern.compile("简历版本\\s*(?:ID)?\\s*[：:#]?\\s*(\\d+)", Pattern.CASE_INSENSITIVE);
    private static final Pattern APPLICATION_ID = Pattern.compile("投递\\s*(?:ID)?\\s*[：:#]?\\s*(\\d+)", Pattern.CASE_INSENSITIVE);

    public MockLLMAdapter(ObjectMapper objectMapper) { super(objectMapper); }

    @Override public AgentModelResponse chatStream(AgentModelRequest request,Consumer<String> onDelta){var response=chat(request);if(response.type()==AgentModelResponse.Type.MESSAGE)emit(response.content(),onDelta);return response;}
    @Override public String textStream(String prompt,Object input,String modelOverride,Consumer<String> onDelta){var output=structuredOutput(prompt,input,InterviewTurnOutput.class);var text=output.reply();emit(text,onDelta);return text;}
    private void emit(String value,Consumer<String> onDelta){for(int i=0;i<value.length();i+=4)onDelta.accept(value.substring(i,Math.min(value.length(),i+4)));}

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
        else if (responseType == ResumePolishOutput.class) output = polishResume(data);
        else if (responseType == ResumeGenerateOutput.class) output = generateResume(data);
        else if (responseType == EmailAnalysisOutput.class) output = analyzeEmail(data);
        else if (responseType == InterviewTurnOutput.class) output = interviewTurn(data);
        else if (responseType == InterviewReportOutput.class) output = interviewReport(data);
        else if (responseType == InterviewAnswerEvaluationOutput.class) output = interviewAnswerEvaluation(data);
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

    private ResumePolishOutput polishResume(Map<String, Object> data) {
        var original = Objects.toString(data.get("content"), "").trim();
        var polished = original.isBlank() ? "" : original.replace("负责", "负责设计并实现");
        if (polished.equals(original)) polished = original + "（建议补充本人承担的技术动作与可核验结果）";
        return new ResumePolishOutput(polished, List.of("强化职责与行动表达"),
                List.of("请确认技术动作和结果均来自真实经历"));
    }

    @SuppressWarnings("unchecked")
    private ResumeGenerateOutput generateResume(Map<String, Object> data) {
        var resume = objectMapper.convertValue(data.get("resume"), Resume.class);
        var jobName = Objects.toString(data.get("jobName"), "目标岗位");
        var company = Objects.toString(data.get("company"), "");
        var markdown = new StringBuilder("# ").append(resume.getFullName()).append("\n\n")
                .append(String.join(" · ", List.of(Objects.toString(resume.getPhone(), ""), Objects.toString(resume.getEmail(), ""), Objects.toString(resume.getLocation(), "")).stream().filter(s -> !s.isBlank()).toList()))
                .append("\n\n## 求职方向\n").append(jobName).append("\n");
        appendItems(markdown, "教育经历", resume.getEducation(), "school");
        appendItems(markdown, "实习经历", resume.getExperiences(), "company");
        appendItems(markdown, "项目经历", resume.getProjects(), "name");
        markdown.append("\n## 技能\n").append(String.join(" · ", Optional.ofNullable(resume.getSkills()).orElse(List.of()))).append("\n");
        return new ResumeGenerateOutput((company.isBlank() ? "" : company + " ") + jobName + "版", markdown.toString(),
                "依据目标 JD 调整内容顺序；未添加 Master Resume 之外的事实", List.of(), List.of());
    }

    private void appendItems(StringBuilder markdown, String title, List<Map<String, Object>> items, String primary) {
        markdown.append("\n## ").append(title).append("\n");
        for (var item : Optional.ofNullable(items).orElse(List.of())) markdown.append("### ").append(Objects.toString(item.get(primary), "待确认"))
                .append("\n").append(Objects.toString(item.get("description"), "")).append("\n");
    }

    private EmailAnalysisOutput analyzeEmail(Map<String, Object> data) {
        var subject = Objects.toString(data.get("subject"), "");
        var content = Objects.toString(data.get("content"), "");
        var text = subject + "\n" + content;
        var lower = text.toLowerCase();
        var type = subject.contains("面试") ? RecruitmentEmailType.INTERVIEW
                : subject.contains("笔试") || subject.contains("测评") ? RecruitmentEmailType.ASSESSMENT
                : subject.contains("遗憾") || subject.contains("不合适") || subject.contains("未通过") ? RecruitmentEmailType.REJECTED
                : lower.contains("offer") || text.contains("录用") ? RecruitmentEmailType.OFFER
                : text.contains("面试") ? RecruitmentEmailType.INTERVIEW
                : text.contains("笔试") || text.contains("测评") ? RecruitmentEmailType.ASSESSMENT
                : text.contains("遗憾") || text.contains("不合适") || text.contains("未通过") ? RecruitmentEmailType.REJECTED
                : RecruitmentEmailType.UNKNOWN;
        var company = explicitGroup(subject, "(?:【|\\[)?([^【】\\[\\]：:]{2,30}?)(?:】|\\])?(?:招聘|校招|面试|笔试|测评|录用|offer)");
        var job = explicitGroup(text, "([\\p{IsHan}A-Za-z0-9 +#.-]{2,40}(?:工程师|开发|产品经理|设计师|岗位))");
        return new EmailAnalysisOutput(type, company, job, type == RecruitmentEmailType.UNKNOWN ? 0.35 : 0.85);
    }

    private String explicitGroup(String text, String regex) {
        var matcher = Pattern.compile(regex, Pattern.CASE_INSENSITIVE).matcher(text);
        return matcher.find() ? matcher.group(1).trim() : "";
    }

    private InterviewTurnOutput interviewTurn(Map<String, Object> data) {
        var history = objectMapper.convertValue(data.getOrDefault("history", List.of()), List.class);
        var mode = Objects.toString(data.get("mode"), "FULL");
        var stage = Objects.toString(data.get("stage"), "TECH_ONE");
        if (history.isEmpty()) return new InterviewTurnOutput("你好，我是本次模拟面试官。请先做一个简短的自我介绍，并说明你最希望我们深入讨论的一段真实经历。");
        var last = history.get(history.size() - 1).toString();
        if ("PROJECT_DEEP".equals(mode)) return new InterviewTurnOutput("你刚才提到的内容中，哪一部分是你亲自负责的？请具体说明技术选型、遇到的难点和你的解决过程。");
        if ("TECH_FOCUS".equals(mode)) return new InterviewTurnOutput("请从技术原理角度展开说明，并解释为什么选择这个方案而不是常见替代方案。");
        if ("PRESSURE".equals(mode)) return new InterviewTurnOutput("这个回答目前还比较概括。请给出一个可验证的具体案例，并说明如果方案失败你会如何定位问题。");
        return new InterviewTurnOutput(("HR".equals(stage)?"这段经历如何影响了你的求职选择？":"请进一步说明其中最关键的业务或专业判断，以及你个人承担的职责。")+"我会基于你的真实回答继续追问。");
    }

    private InterviewAnswerEvaluationOutput interviewAnswerEvaluation(Map<String,Object> data){var answer=Objects.toString(data.get("answer"),"");var completeness=Math.min(95,35+answer.length()/3);var technical=Math.min(95,45+answer.length()/4);var communication=Math.min(95,55+answer.length()/5);var score=(technical*45+completeness*35+communication*20)/100;var missing=new ArrayList<String>();if(answer.length()<80)missing.add("回答需要补充具体实现细节");if(!answer.matches(".*\\d+.*"))missing.add("缺少可验证的量化结果");return new InterviewAnswerEvaluationOutput(technical,completeness,communication,score,List.of("回答与当前问题相关"),missing,List.of(),score<72?InterviewDecision.FOLLOW_UP:InterviewDecision.NEXT_TOPIC);}
    private InterviewReportOutput interviewReport(Map<String, Object> data) {
        var history = objectMapper.convertValue(data.getOrDefault("history", List.of()), List.class);
        var userAnswers = history.stream().filter(item -> item.toString().contains("role=user")).count();
        var score = (int)Math.min(88, 55 + userAnswers * 8);
        return new InterviewReportOutput(score, userAnswers > 0 ? "能够围绕问题提供回答，具备继续深挖的基础" : "有效回答信息不足",
                "部分回答仍缺少个人职责、技术决策和结果证据", "使用背景—任务—行动—结果结构作答，并补充可核验的技术细节");
    }
}
