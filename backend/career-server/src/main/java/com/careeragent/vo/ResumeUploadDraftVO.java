package com.careeragent.vo;

import com.careeragent.agent.structured.ResumeParseOutput;

public record ResumeUploadDraftVO(String fileUrl, String fileName, String fileType,
                                  ResumeParseOutput parsedResume) {}
