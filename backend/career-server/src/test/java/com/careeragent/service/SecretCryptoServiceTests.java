package com.careeragent.service;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;

class SecretCryptoServiceTests {

    private final SecretCryptoService service = new SecretCryptoService("unit-test-master-key");

    @Test
    void encryptsAndDecryptsWithoutPersistingPlaintext() {
        String encrypted = service.encrypt("sk-secret-value");

        assertThat(encrypted).isNotEqualTo("sk-secret-value");
        assertThat(service.decrypt(encrypted)).isEqualTo("sk-secret-value");
    }

    @Test
    void usesRandomInitializationVector() {
        assertThat(service.encrypt("same-secret"))
                .isNotEqualTo(service.encrypt("same-secret"));
    }
}
