package com.careeragent.exception;
public class PendingActionAlreadyProcessedException extends BusinessException {
 public PendingActionAlreadyProcessedException(Long id){this(id, "processed");}
 public PendingActionAlreadyProcessedException(Long id, String status){super(40910,"PendingAction already processed: "+id+" ("+status+")");}
}
