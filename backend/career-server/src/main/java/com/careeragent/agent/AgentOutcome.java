package com.careeragent.agent;

import com.careeragent.vo.AgentChatResponse;
import com.careeragent.vo.AgentStreamEvent;
import java.util.List;

public record AgentOutcome(AgentChatResponse response, List<AgentStreamEvent> events) {}
