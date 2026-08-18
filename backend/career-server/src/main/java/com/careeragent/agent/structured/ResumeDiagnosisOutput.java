package com.careeragent.agent.structured;

import java.util.List;

public record ResumeDiagnosisOutput(List<String> strengths, List<String> improvements, List<String> suggestions) {}
