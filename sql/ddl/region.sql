
CREATE TABLE IF NOT EXISTS region (
    region_id    INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    region_code  STRING NOT NULL,   -- NRB, CEN, COAST
    region_name  STRING NOT NULL,
    country_code STRING,            -- ISO alpha-3 (KEN, UAE...)
    is_active    BOOLEAN NOT NULL DEFAULT true,
    created_at   TIMESTAMP NOT NULL DEFAULT current_timestamp(),
    created_by   STRING,
    updated_at   TIMESTAMP,
    updated_by   STRING
)
USING DELTA;
