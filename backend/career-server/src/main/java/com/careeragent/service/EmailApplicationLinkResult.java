package com.careeragent.service;
public record EmailApplicationLinkResult(Long applicationId,boolean statusUpdated) {
 public static EmailApplicationLinkResult none(){return new EmailApplicationLinkResult(null,false);}
}
