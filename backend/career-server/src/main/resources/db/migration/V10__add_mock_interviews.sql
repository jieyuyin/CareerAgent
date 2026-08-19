CREATE TABLE interview_session (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL REFERENCES app_user(id) ON DELETE CASCADE,
    application_id BIGINT REFERENCES job_application(id) ON DELETE SET NULL,
    job_id BIGINT REFERENCES job_description(id) ON DELETE SET NULL,
    stage VARCHAR(20) NOT NULL CHECK (stage IN ('HR', 'TECH_ONE', 'TECH_TWO', 'FINAL')),
    mode VARCHAR(30) NOT NULL CHECK (mode IN ('FULL', 'PROJECT_DEEP', 'TECH_FOCUS', 'PRESSURE')),
    duration INTEGER NOT NULL CHECK (duration IN (15, 30, 60)),
    status VARCHAR(20) NOT NULL CHECK (status IN ('IN_PROGRESS', 'FINISHED')),
    score INTEGER CHECK (score IS NULL OR score BETWEEN 0 AND 100),
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE interview_message (
    id BIGSERIAL PRIMARY KEY,
    session_id BIGINT NOT NULL REFERENCES interview_session(id) ON DELETE CASCADE,
    role VARCHAR(20) NOT NULL CHECK (role IN ('assistant', 'user')),
    content TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE interview_report (
    id BIGSERIAL PRIMARY KEY,
    session_id BIGINT NOT NULL UNIQUE REFERENCES interview_session(id) ON DELETE CASCADE,
    score INTEGER NOT NULL CHECK (score BETWEEN 0 AND 100),
    strength TEXT NOT NULL,
    weakness TEXT NOT NULL,
    suggestion TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_interview_session_user_time ON interview_session(user_id, created_at DESC);
CREATE INDEX idx_interview_message_session_time ON interview_message(session_id, created_at, id);
