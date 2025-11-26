
CREATE TABLE IF NOT EXISTS lifecycle_status (
    lifecycle_status_id    INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    lifecycle_status_code  STRING NOT NULL, -- ACTIVE, DISC, NPI
    lifecycle_status_name  STRING NOT NULL,
    is_active              BOOLEAN NOT NULL DEFAULT true,
    created_at             TIMESTAMP NOT NULL DEFAULT current_timestamp(),
    created_by             STRING,
    updated_at             TIMESTAMP,
    updated_by             STRING
)
USING DELTA;

