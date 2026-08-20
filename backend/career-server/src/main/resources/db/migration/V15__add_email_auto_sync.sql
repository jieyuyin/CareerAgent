ALTER TABLE email_account
    ADD COLUMN auto_sync_enabled BOOLEAN NOT NULL DEFAULT FALSE,
    ADD COLUMN sync_interval_hours INTEGER NOT NULL DEFAULT 4 CHECK (sync_interval_hours BETWEEN 1 AND 24),
    ADD COLUMN next_sync_time TIMESTAMPTZ,
    ADD COLUMN last_sync_error TEXT;

CREATE INDEX idx_email_account_auto_sync_due
    ON email_account (next_sync_time)
    WHERE auto_sync_enabled = TRUE;
