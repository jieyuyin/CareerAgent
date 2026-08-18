package com.careeragent.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.careeragent.domain.enums.OfficialSourceType;
import com.careeragent.domain.enums.SourceSyncStatus;
import com.careeragent.dto.JobSourceConfigRequest;
import com.careeragent.exception.BusinessException;
import com.careeragent.mapper.JobDescriptionMapper;
import com.careeragent.mapper.JobSourceConfigMapper;
import com.careeragent.security.CurrentUserProvider;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class OfficialJobSourceServiceTests {
    private OfficialJobSourceService service;

    @BeforeEach
    void setUp() {
        var currentUser = mock(CurrentUserProvider.class);
        when(currentUser.getCurrentUserId()).thenReturn(1L);
        service = new OfficialJobSourceService(mock(JobSourceConfigMapper.class),
                mock(JobDescriptionMapper.class), currentUser, new ObjectMapper());
    }

    @Test
    void rejectsProviderDomainMismatch() {
        var request = new JobSourceConfigRequest("Example", OfficialSourceType.GREENHOUSE,
                "https://api.lever.co/v0/postings/example", null, true);

        assertThatThrownBy(() -> service.create(request))
                .isInstanceOf(BusinessException.class)
                .hasMessageContaining("域名");
    }

    @Test
    void createsDisabledSourceWithInitialSyncState() {
        var request = new JobSourceConfigRequest("Example", OfficialSourceType.GREENHOUSE,
                "https://boards-api.greenhouse.io/v1/boards/example/jobs?content=true", null, false);

        var source = service.create(request);

        assertThat(source.getUserId()).isEqualTo(1L);
        assertThat(source.getEnabled()).isFalse();
        assertThat(source.getLastSyncStatus()).isEqualTo(SourceSyncStatus.NEVER);
    }
}
