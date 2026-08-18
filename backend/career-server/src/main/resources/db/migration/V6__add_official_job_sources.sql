CREATE TABLE job_source_config (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL REFERENCES app_user(id) ON DELETE CASCADE,
    company VARCHAR(200) NOT NULL,
    source_type VARCHAR(30) NOT NULL CHECK (source_type IN ('GREENHOUSE', 'LEVER')),
    api_url VARCHAR(2000) NOT NULL,
    career_url VARCHAR(2000),
    enabled BOOLEAN NOT NULL DEFAULT TRUE,
    last_sync_status VARCHAR(20) NOT NULL DEFAULT 'NEVER' CHECK (last_sync_status IN ('NEVER', 'RUNNING', 'SUCCESS', 'FAILED')),
    last_sync_at TIMESTAMPTZ,
    last_success_at TIMESTAMPTZ,
    last_error VARCHAR(1000),
    last_discovered_count INTEGER NOT NULL DEFAULT 0,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE job_description ADD COLUMN source_config_id BIGINT REFERENCES job_source_config(id) ON DELETE SET NULL;
ALTER TABLE job_description ADD COLUMN external_job_id VARCHAR(300);

CREATE INDEX idx_job_source_config_user ON job_source_config(user_id);
CREATE INDEX idx_job_description_source_config ON job_description(source_config_id);
CREATE UNIQUE INDEX uk_job_description_source_external
    ON job_description(user_id, source_config_id, external_job_id)
    WHERE source_config_id IS NOT NULL AND external_job_id IS NOT NULL;
