package com.careeragent;

import static org.assertj.core.api.Assertions.assertThat;

import com.careeragent.web.HealthController;
import org.junit.jupiter.api.Test;

class CareerServerApplicationTests {
    @Test
    void healthResponseReportsServiceUp() {
        var response = new HealthController().health();

        assertThat(response)
                .containsEntry("status", "UP")
                .containsEntry("service", "career-server");
    }
}
