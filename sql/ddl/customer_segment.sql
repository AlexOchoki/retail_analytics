
CREATE TABLE IF NOT EXISTS customer_segment (
    customer_segment_id    INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    customer_segment_code  STRING NOT NULL, -- VALUE, PREMIUM, VIP
    customer_segment_name  STRING NOT NULL,
    description            STRING,
    is_active              BOOLEAN NOT NULL DEFAULT true,
    created_at             TIMESTAMP NOT NULL DEFAULT current_timestamp(),
    created_by             STRING,
    updated_at             TIMESTAMP,
    updated_by             STRING
)
USING DELTA;
