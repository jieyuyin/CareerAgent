CREATE TABLE email_account (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL REFERENCES app_user(id) ON DELETE CASCADE,
    provider VARCHAR(20) NOT NULL CHECK (provider IN ('NETEASE_163')),
    email VARCHAR(255) NOT NULL,
    encrypted_authorization_code TEXT NOT NULL,
    status VARCHAR(20) NOT NULL CHECK (status IN ('CONNECTED', 'ERROR')),
    last_sync_time TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uk_email_account_user UNIQUE (user_id)
);

CREATE TABLE recruitment_email (
    id BIGSERIAL PRIMARY KEY,
    email_account_id BIGINT NOT NULL REFERENCES email_account(id) ON DELETE CASCADE,
    application_id BIGINT REFERENCES job_application(id) ON DELETE SET NULL,
    message_uid VARCHAR(255) NOT NULL,
    subject VARCHAR(1000) NOT NULL,
    sender VARCHAR(1000),
    content TEXT,
    email_type VARCHAR(20) NOT NULL CHECK (email_type IN ('INTERVIEW', 'ASSESSMENT', 'OFFER', 'REJECTED', 'UNKNOWN')),
    company VARCHAR(200),
    job_name VARCHAR(200),
    confidence NUMERIC(5,4),
    received_time TIMESTAMPTZ NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uk_recruitment_email_message UNIQUE (email_account_id, message_uid)
);

CREATE INDEX idx_recruitment_email_account_time ON recruitment_email(email_account_id, received_time DESC);
CREATE INDEX idx_recruitment_email_application ON recruitment_email(application_id);

ALTER TABLE application_event DROP CONSTRAINT ck_event_type;
ALTER TABLE application_event ADD CONSTRAINT ck_event_type CHECK (event_type IN ('STATUS_CHANGE', 'NOTE', 'INTERVIEW_CREATED', 'OFFER_RECEIVED', 'CLOSED', 'EMAIL_RECEIVED'));
