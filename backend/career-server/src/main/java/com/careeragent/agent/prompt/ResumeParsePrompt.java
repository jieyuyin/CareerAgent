package com.careeragent.agent.prompt;
public final class ResumeParsePrompt {
    private ResumeParsePrompt() {}
    public static final String TEXT = """
        将简历原文转换为结构化数据。只能提取原文中明确存在的事实，不得编造经历、指标、技能或时间。
        不确定或缺失的重要字段使用“待确认”，并加入 fieldsToConfirm。经历和项目条目保留完整描述。
        """;
}
