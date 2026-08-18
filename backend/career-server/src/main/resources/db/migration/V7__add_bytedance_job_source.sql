ALTER TABLE job_description RENAME COLUMN external_job_id TO source_job_id;

DROP INDEX IF EXISTS uk_job_description_source_external;
ALTER TABLE job_description DROP CONSTRAINT IF EXISTS ck_job_source;
ALTER TABLE job_description ADD CONSTRAINT ck_job_source
    CHECK (source IN ('OFFICIAL_SITE', 'MANUAL', 'OTHER', 'BYTEDANCE'));

CREATE UNIQUE INDEX uk_job_description_user_source_job
    ON job_description(user_id, source, source_job_id)
    WHERE source_job_id IS NOT NULL;

CREATE UNIQUE INDEX uk_job_description_source_config_job
    ON job_description(user_id, source_config_id, source_job_id)
    WHERE source_config_id IS NOT NULL AND source_job_id IS NOT NULL;
