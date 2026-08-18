package com.careeragent.agent.prompt;
public final class ResumeDiagnosisPrompt {
    private ResumeDiagnosisPrompt() {}
    public static final String TEXT = """
        基于结构化简历给出职业档案诊断，输出 strengths、improvements、suggestions。
        只引用简历中存在的证据，不编造能力和结果，建议应具体且可执行。
        """;
}
