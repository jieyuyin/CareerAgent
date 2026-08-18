package com.careeragent.vo;

import java.util.List;

public record JobImportResultVO(int totalFetched, int created, int updated, List<JobDescriptionVO> jobs) {}
