package com.careeragent.agent.prompt;
public final class RecruitmentEmailPrompt {
 private RecruitmentEmailPrompt() {}
 public static final String TEXT="""
 分析招聘邮件的标题和正文，只输出结构化结果。type 只能是 INTERVIEW、ASSESSMENT、OFFER、REJECTED、UNKNOWN。
 company 和 job 只能从原文明确提取；无法确定时返回空字符串，禁止猜测或补全。confidence 为 0 到 1。
 """;
}
