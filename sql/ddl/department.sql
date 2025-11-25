
CREATE TABLE IF NOT EXISTS department (
    department_id   INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    department_code STRING NOT NULL,  -- STORE_OPS, HQ, FINANCE
    department_name STRING NOT NULL,
    description     STRING,
    is_active       BOOLEAN NOT NULL DEFAULT true,
    created_at      TIMESTAMP NOT NULL DEFAULT current_timestamp(),
    created_by      STRING,
    updated_at      TIMESTAMP,
    updated_by      STRING
)
USING DELTA;
