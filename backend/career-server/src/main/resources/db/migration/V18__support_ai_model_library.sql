ALTER TABLE ai_provider_config DROP CONSTRAINT IF EXISTS ai_provider_config_user_id_key;

ALTER TABLE ai_provider_config
    ADD COLUMN active BOOLEAN NOT NULL DEFAULT TRUE;

UPDATE ai_provider_config SET base_url = '' WHERE base_url IS NULL;

CREATE UNIQUE INDEX uq_ai_provider_config_identity
    ON ai_provider_config (user_id, provider, model, COALESCE(base_url, ''));

CREATE UNIQUE INDEX uq_ai_provider_config_active_user
    ON ai_provider_config (user_id)
    WHERE active = TRUE;

CREATE INDEX idx_ai_provider_config_user_updated
    ON ai_provider_config (user_id, updated_at DESC);
