package com.careeragent.agent.structured;

import java.util.List;

public record ResumePolishOutput(String polishedContent, List<String> changes, List<String> confirmations) {}
