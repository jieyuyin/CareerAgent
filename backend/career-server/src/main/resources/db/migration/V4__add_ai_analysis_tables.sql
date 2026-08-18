CREATE TABLE job_match_report (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL REFERENCES app_user(id),
    job_description_id BIGINT NOT NULL REFERENCES job_description(id) ON DELETE CASCADE,
    resume_id BIGINT NOT NULL REFERENCES resume(id) ON DELETE CASCADE,
    match_score INTEGER NOT NULL CHECK (match_score BETWEEN 0 AND 100),
    matched_skills JSONB NOT NULL DEFAULT '[]'::jsonb,
    missing_skills JSONB NOT NULL DEFAULT '[]'::jsonb,
    weak_expressions JSONB NOT NULL DEFAULT '[]'::jsonb,
    unsupported_claims JSONB NOT NULL DEFAULT '[]'::jsonb,
    recommended_changes JSONB NOT NULL DEFAULT '[]'::jsonb,
    evidence JSONB NOT NULL DEFAULT '[]'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE rewrite_suggestion (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL REFERENCES app_user(id),
    job_description_id BIGINT NOT NULL REFERENCES job_description(id) ON DELETE CASCADE,
    resume_id BIGINT NOT NULL REFERENCES resume(id) ON DELETE CASCADE,
    item_type VARCHAR(20) NOT NULL CHECK (item_type IN ('EXPERIENCE', 'PROJECT')),
    item_id VARCHAR(100) NOT NULL,
    original_content TEXT NOT NULL,
    suggested_content TEXT NOT NULL,
    reason TEXT NOT NULL,
    matched_job_requirements JSONB NOT NULL DEFAULT '[]'::jsonb,
    facts_to_confirm JSONB NOT NULL DEFAULT '[]'::jsonb,
    warnings JSONB NOT NULL DEFAULT '[]'::jsonb,
    status VARCHAR(20) NOT NULL CHECK (status IN ('PENDING', 'ACCEPTED', 'REJECTED', 'SUPERSEDED')),
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_job_match_report_owner ON job_match_report(user_id, job_description_id, resume_id);
CREATE INDEX idx_rewrite_suggestion_owner ON rewrite_suggestion(user_id, resume_id, status);
