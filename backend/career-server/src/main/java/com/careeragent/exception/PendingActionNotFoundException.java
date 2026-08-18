package com.careeragent.exception;
public class PendingActionNotFoundException extends BusinessException { public PendingActionNotFoundException(Long id){super(40411,"PendingAction not found: "+id);} }
