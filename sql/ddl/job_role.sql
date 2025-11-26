
CREATE TABLE IF NOT EXISTS job_role (
    job_role_id   INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    job_role_code STRING NOT NULL,  -- CASHIER, STORE_MGR, PICKER
    job_role_name STRING NOT NULL,
    description   STRING,
    is_active     BOOLEAN NOT NULL DEFAULT true,
    created_at    TIMESTAMP NOT NULL DEFAULT current_timestamp(),
    created_by    STRING,
    updated_at    TIMESTAMP,
    updated_by    STRING
)
USING DELTA;
