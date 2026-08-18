package com.careeragent.agent.tool;
public record ToolResult(boolean success, Object data, String message, String errorCode) {
 public static ToolResult success(Object data){return new ToolResult(true,data,"success",null);}
 public static ToolResult failure(String message,String errorCode){return new ToolResult(false,null,message,errorCode);}
}
