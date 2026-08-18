ALTER TABLE job_description
    ADD CONSTRAINT ck_job_recruitment_type CHECK (recruitment_type IN ('CAMPUS', 'INTERNSHIP', 'SOCIAL', 'UNKNOWN')),
    ADD CONSTRAINT ck_job_source CHECK (source IN ('OFFICIAL_SITE', 'MANUAL', 'OTHER')),
    ADD CONSTRAINT ck_job_status CHECK (status IN ('OPEN', 'CLOSED', 'UNKNOWN'));

ALTER TABLE resume_version
    ADD CONSTRAINT ck_resume_version_status CHECK (status IN ('DRAFT', 'CONFIRMED', 'ARCHIVED'));

ALTER TABLE job_application
    ADD CONSTRAINT ck_application_channel CHECK (channel IN ('OFFICIAL_SITE', 'REFERRAL', 'BOSS', 'LIEPIN', 'OTHER')),
    ADD CONSTRAINT ck_application_status CHECK (status IN ('TO_APPLY', 'APPLIED', 'SCREENING', 'ASSESSMENT', 'INTERVIEW', 'OFFER', 'CLOSED'));

ALTER TABLE application_event
    ADD CONSTRAINT ck_event_from_status CHECK (from_status IS NULL OR from_status IN ('TO_APPLY', 'APPLIED', 'SCREENING', 'ASSESSMENT', 'INTERVIEW', 'OFFER', 'CLOSED')),
    ADD CONSTRAINT ck_event_to_status CHECK (to_status IS NULL OR to_status IN ('TO_APPLY', 'APPLIED', 'SCREENING', 'ASSESSMENT', 'INTERVIEW', 'OFFER', 'CLOSED')),
    ADD CONSTRAINT ck_event_type CHECK (event_type IN ('STATUS_CHANGE', 'NOTE', 'INTERVIEW_CREATED', 'OFFER_RECEIVED', 'CLOSED'));
