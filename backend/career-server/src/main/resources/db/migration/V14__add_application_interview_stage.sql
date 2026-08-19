ALTER TABLE job_application ADD COLUMN interview_stage VARCHAR(20);
ALTER TABLE job_application ADD CONSTRAINT ck_application_interview_stage
    CHECK (interview_stage IS NULL OR interview_stage IN ('TECH_ONE', 'TECH_TWO', 'TECH_THREE', 'HR'));
UPDATE job_application SET interview_stage = 'TECH_ONE' WHERE status = 'INTERVIEW' AND interview_stage IS NULL;
