package com.careeragent.agent.tool;
import com.careeragent.domain.enums.PendingActionType;
import java.util.Map;
public interface AgentTool {
 String getName();
 String getDescription();
 Map<String,Object> getInputSchema();
 default boolean requiresConfirmation(){return false;}
 default PendingActionType getActionType(){return PendingActionType.OTHER;}
 default String confirmationSummary(Map<String,Object> arguments){return "确认执行 "+getName();}
 ToolResult execute(ToolContext context, Map<String,Object> arguments);
}
