package com.careeragent.exception;
public class ToolNotFoundException extends BusinessException { public ToolNotFoundException(String name){super(40410,"Tool not found: "+name);} }
