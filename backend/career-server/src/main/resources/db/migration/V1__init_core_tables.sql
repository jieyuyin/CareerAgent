CREATE TABLE app_user (
    id BIGSERIAL PRIMARY KEY,
    username VARCHAR(64) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    avatar_url VARCHAR(1000),
    status VARCHAR(20) NOT NULL CHECK (status IN ('ACTIVE', 'DISABLED')),
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE job_description (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL REFERENCES app_user(id),
    company VARCHAR(200) NOT NULL,
    job_name VARCHAR(200) NOT NULL,
    department VARCHAR(200),
    city VARCHAR(100),
    recruitment_type VARCHAR(20) NOT NULL,
    source VARCHAR(30) NOT NULL,
    source_url VARCHAR(2000),
    raw_content TEXT NOT NULL,
    responsibilities JSONB NOT NULL DEFAULT '[]'::jsonb,
    required_skills JSONB NOT NULL DEFAULT '[]'::jsonb,
    preferred_skills JSONB NOT NULL DEFAULT '[]'::jsonb,
    keywords JSONB NOT NULL DEFAULT '[]'::jsonb,
    education_requirement VARCHAR(500),
    experience_requirement VARCHAR(500),
    job_focus JSONB NOT NULL DEFAULT '[]'::jsonb,
    interview_topics JSONB NOT NULL DEFAULT '[]'::jsonb,
    status VARCHAR(20) NOT NULL,
    published_at TIMESTAMPTZ,
    last_verified_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE resume (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL REFERENCES app_user(id),
    name VARCHAR(200) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(50),
    email VARCHAR(255),
    location VARCHAR(200),
    target_role VARCHAR(200),
    education JSONB NOT NULL DEFAULT '[]'::jsonb,
    experiences JSONB NOT NULL DEFAULT '[]'::jsonb,
    projects JSONB NOT NULL DEFAULT '[]'::jsonb,
    skills JSONB NOT NULL DEFAULT '[]'::jsonb,
    is_default BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE UNIQUE INDEX uk_resume_one_default_per_user ON resume(user_id) WHERE is_default = TRUE;

CREATE TABLE resume_version (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL REFERENCES app_user(id),
    resume_id BIGINT NOT NULL REFERENCES resume(id) ON DELETE RESTRICT,
    job_description_id BIGINT REFERENCES job_description(id) ON DELETE RESTRICT,
    version_name VARCHAR(200) NOT NULL,
    target_company VARCHAR(200),
    target_job_name VARCHAR(200),
    snapshot_data JSONB NOT NULL,
    change_summary TEXT,
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE job_application (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL REFERENCES app_user(id),
    job_description_id BIGINT NOT NULL REFERENCES job_description(id) ON DELETE RESTRICT,
    resume_version_id BIGINT NOT NULL REFERENCES resume_version(id) ON DELETE RESTRICT,
    company VARCHAR(200) NOT NULL,
    job_name VARCHAR(200) NOT NULL,
    channel VARCHAR(30) NOT NULL,
    status VARCHAR(30) NOT NULL,
    applied_at TIMESTAMPTZ,
    next_action VARCHAR(500),
    next_action_at TIMESTAMPTZ,
    remark TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE application_event (
    id BIGSERIAL PRIMARY KEY,
    application_id BIGINT NOT NULL REFERENCES job_application(id) ON DELETE CASCADE,
    from_status VARCHAR(30),
    to_status VARCHAR(30),
    event_type VARCHAR(30) NOT NULL,
    remark TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_job_description_user_id ON job_description(user_id);
CREATE INDEX idx_job_description_company ON job_description(company);
CREATE INDEX idx_job_description_status ON job_description(status);
CREATE INDEX idx_resume_user_id ON resume(user_id);
CREATE INDEX idx_resume_version_resume_id ON resume_version(resume_id);
CREATE INDEX idx_resume_version_job_id ON resume_version(job_description_id);
CREATE INDEX idx_application_user_id ON job_application(user_id);
CREATE INDEX idx_application_status ON job_application(status);
CREATE INDEX idx_application_job_id ON job_application(job_description_id);
CREATE INDEX idx_application_resume_version_id ON job_application(resume_version_id);
CREATE INDEX idx_application_event_application_id ON application_event(application_id);

INSERT INTO app_user (id, username, email, status)
VALUES (1, 'demo', 'demo@careeragent.local', 'ACTIVE');
SELECT setval(pg_get_serial_sequence('app_user', 'id'), 1, true);

INSERT INTO job_description
    (user_id, company, job_name, city, recruitment_type, source, raw_content, status)
VALUES
    (1, '字节跳动', 'AI 应用工程师', '上海', 'CAMPUS', 'MANUAL', '开发和维护 AI 应用。', 'OPEN'),
    (1, '腾讯', '前端开发工程师', '深圳', 'CAMPUS', 'MANUAL', '负责 Web 前端产品研发。', 'OPEN');

INSERT INTO resume (user_id, name, full_name, email, target_role, is_default)
VALUES (1, '基础简历', 'Demo User', 'demo@careeragent.local', '软件工程师', TRUE);
