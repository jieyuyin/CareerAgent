package com.careeragent.vo;
public record AiConfigVO(String provider,String model,String baseUrl,boolean apiKeyConfigured,boolean runtimeEditable,String apiKeyMasked) {}
