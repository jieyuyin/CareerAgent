package com.careeragent.agent.structured;
import com.careeragent.domain.enums.RewriteItemType;
import java.util.List;
public record ExperienceRewriteOutput(RewriteItemType itemType, String itemId, String originalText,
        String suggestedText, String reason, List<String> matchedJobRequirements,
        List<String> factsToConfirm, List<String> warnings) {}
