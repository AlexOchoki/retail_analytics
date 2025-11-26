
CREATE TABLE IF NOT EXISTS loyalty_tier (
    loyalty_tier_id    INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    loyalty_tier_code  STRING NOT NULL, -- BRONZE, SILVER, GOLD
    loyalty_tier_name  STRING NOT NULL,
    min_points         INT,
    max_points         INT,
    description        STRING,
    is_active          BOOLEAN NOT NULL DEFAULT true,
    created_at         TIMESTAMP NOT NULL DEFAULT current_timestamp(),
    created_by         STRING,
    updated_at         TIMESTAMP,
    updated_by         STRING
)
USING DELTA;
