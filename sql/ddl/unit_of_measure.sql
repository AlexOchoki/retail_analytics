

CREATE TABLE IF NOT EXISTS uom (
    uom_id     INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    uom_code   STRING NOT NULL,   -- EA, KG, L, CTN
    uom_name   STRING NOT NULL,
    uom_type   STRING,            -- weight, volume, count
    is_active  BOOLEAN NOT NULL DEFAULT true,
    created_at TIMESTAMP NOT NULL DEFAULT current_timestamp(),
    created_by STRING,
    updated_at TIMESTAMP,
    updated_by STRING
)
USING DELTA;

