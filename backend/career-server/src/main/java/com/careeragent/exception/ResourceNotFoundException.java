package com.careeragent.exception;
public class ResourceNotFoundException extends BusinessException {
    public ResourceNotFoundException(String resource, Long id) { super(40401, resource + " not found: " + id); }
}
