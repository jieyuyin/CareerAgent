ALTER TABLE job_application DROP CONSTRAINT ck_application_status;
ALTER TABLE application_event DROP CONSTRAINT ck_event_from_status;
ALTER TABLE application_event DROP CONSTRAINT ck_event_to_status;

UPDATE job_application SET status = 'APPLIED' WHERE status = 'TO_APPLY';
UPDATE job_application SET status = 'REJECTED' WHERE status = 'CLOSED';
UPDATE application_event SET from_status = 'APPLIED' WHERE from_status = 'TO_APPLY';
UPDATE application_event SET to_status = 'APPLIED' WHERE to_status = 'TO_APPLY';
UPDATE application_event SET from_status = 'REJECTED' WHERE from_status = 'CLOSED';
UPDATE application_event SET to_status = 'REJECTED' WHERE to_status = 'CLOSED';

ALTER TABLE job_application ADD CONSTRAINT ck_application_status CHECK (status IN ('APPLIED', 'SCREENING', 'ASSESSMENT', 'INTERVIEW', 'OFFER', 'REJECTED'));
ALTER TABLE application_event ADD CONSTRAINT ck_event_from_status CHECK (from_status IS NULL OR from_status IN ('APPLIED', 'SCREENING', 'ASSESSMENT', 'INTERVIEW', 'OFFER', 'REJECTED'));
ALTER TABLE application_event ADD CONSTRAINT ck_event_to_status CHECK (to_status IS NULL OR to_status IN ('APPLIED', 'SCREENING', 'ASSESSMENT', 'INTERVIEW', 'OFFER', 'REJECTED'));
