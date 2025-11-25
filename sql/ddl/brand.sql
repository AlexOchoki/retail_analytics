
CREATE TABLE IF NOT EXISTS brand (
    brand_id     INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    brand_code   STRING NOT NULL,
    brand_name   STRING NOT NULL,
    brand_owner  STRING,
    is_active    BOOLEAN NOT NULL DEFAULT true,
    created_at   TIMESTAMP NOT NULL DEFAULT current_timestamp(),
    created_by   STRING,
    updated_at   TIMESTAMP,
    updated_by   STRING
)
USING DELTA;
