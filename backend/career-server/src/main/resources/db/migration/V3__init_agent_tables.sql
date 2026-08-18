CREATE TABLE agent_conversation (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL REFERENCES app_user(id),
    title VARCHAR(200) NOT NULL,
    status VARCHAR(20) NOT NULL CHECK (status IN ('ACTIVE', 'COMPLETED', 'FAILED')),
    context_data JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE agent_message (
    id BIGSERIAL PRIMARY KEY,
    conversation_id BIGINT NOT NULL REFERENCES agent_conversation(id) ON DELETE CASCADE,
    role VARCHAR(20) NOT NULL CHECK (role IN ('USER', 'ASSISTANT', 'TOOL', 'SYSTEM')),
    content TEXT NOT NULL,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tool_execution (
    id BIGSERIAL PRIMARY KEY,
    conversation_id BIGINT NOT NULL REFERENCES agent_conversation(id) ON DELETE CASCADE,
    tool_call_id VARCHAR(100) NOT NULL,
    tool_name VARCHAR(100) NOT NULL,
    input_data JSONB NOT NULL,
    output_data JSONB,
    status VARCHAR(30) NOT NULL CHECK (status IN ('PENDING', 'RUNNING', 'SUCCESS', 'FAILED', 'WAITING_CONFIRMATION', 'CANCELLED')),
    error_message TEXT,
    started_at TIMESTAMPTZ,
    finished_at TIMESTAMPTZ,
    duration_ms BIGINT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uk_tool_execution_call UNIQUE (conversation_id, tool_call_id)
);

CREATE TABLE pending_action (
    id BIGSERIAL PRIMARY KEY,
    conversation_id BIGINT NOT NULL REFERENCES agent_conversation(id) ON DELETE CASCADE,
    tool_execution_id BIGINT NOT NULL UNIQUE REFERENCES tool_execution(id) ON DELETE CASCADE,
    action_type VARCHAR(40) NOT NULL CHECK (action_type IN ('CREATE_RESUME_VERSION', 'UPDATE_RESUME_VERSION', 'CREATE_APPLICATION', 'UPDATE_APPLICATION_STATUS', 'DELETE_RESOURCE', 'OTHER')),
    tool_name VARCHAR(100) NOT NULL,
    payload JSONB NOT NULL,
    summary VARCHAR(1000) NOT NULL,
    status VARCHAR(20) NOT NULL CHECK (status IN ('WAITING', 'CONFIRMED', 'REJECTED', 'EXPIRED', 'EXECUTED')),
    expires_at TIMESTAMPTZ NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_agent_conversation_user_id ON agent_conversation(user_id);
CREATE INDEX idx_agent_message_conversation_id ON agent_message(conversation_id);
CREATE INDEX idx_tool_execution_conversation_id ON tool_execution(conversation_id);
CREATE INDEX idx_tool_execution_status ON tool_execution(status);
CREATE INDEX idx_pending_action_conversation_id ON pending_action(conversation_id);
CREATE INDEX idx_pending_action_status ON pending_action(status);
