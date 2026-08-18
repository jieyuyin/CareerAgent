package com.careeragent.exception;
public class ToolExecutionFailedException extends BusinessException { public ToolExecutionFailedException(String message){super(50010,"Tool execution failed: "+message);} }
