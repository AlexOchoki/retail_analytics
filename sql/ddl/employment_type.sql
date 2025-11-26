
CREATE TABLE IF NOT EXISTS employment_type (
    employment_type_id    INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    employment_type_code  STRING NOT NULL,  -- FULL_TIME, PART_TIME, CONTRACT
    employment_type_name  STRING NOT NULL,
    is_full_time          BOOLEAN NOT NULL DEFAULT false,
    description           STRING,
    is_active             BOOLEAN NOT NULL DEFAULT true,
    created_at            TIMESTAMP NOT NULL DEFAULT current_timestamp(),
    created_by            STRING,
    updated_at            TIMESTAMP,
    updated_by            STRING
)
USING DELTA;
