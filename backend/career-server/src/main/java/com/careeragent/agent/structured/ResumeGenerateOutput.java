package com.careeragent.agent.structured;

import java.util.List;

public record ResumeGenerateOutput(String versionName, String markdown, String changeSummary,
                                   List<String> matchedRequirements, List<String> missingEvidence) {}
