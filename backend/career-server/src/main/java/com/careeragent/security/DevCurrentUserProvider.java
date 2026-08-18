package com.careeragent.security;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Component;
@Component
@Profile("dev")
public class DevCurrentUserProvider implements CurrentUserProvider {
    @Override public Long getCurrentUserId() { return 1L; }
}
