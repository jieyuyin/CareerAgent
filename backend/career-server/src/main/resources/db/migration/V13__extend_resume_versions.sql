ALTER TABLE resume_version ADD COLUMN version_type VARCHAR(20) NOT NULL DEFAULT 'CUSTOM';
ALTER TABLE resume_version ADD COLUMN content_markdown TEXT;
ALTER TABLE resume_version ADD COLUMN html_content TEXT;
ALTER TABLE resume_version ADD COLUMN pdf_url VARCHAR(2000);
ALTER TABLE resume_version ADD CONSTRAINT ck_resume_version_type CHECK (version_type IN ('MASTER', 'CUSTOM'));

CREATE INDEX idx_resume_version_user_created ON resume_version(user_id, created_at DESC);
