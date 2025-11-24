--- Sales_channel

CREATE TABLE IF NOT EXISTS sales_channel (
    sales_channel_id    INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    sales_channel_code  STRING NOT NULL,  -- POS, ONLINE, CALL_CENTER...
    sales_channel_name  STRING NOT NULL,
    channel_group_id    INT NOT NULL,     -- logical FK → channel_group
    is_physical         BOOLEAN NOT NULL DEFAULT false,
    is_digital          BOOLEAN NOT NULL DEFAULT false,
    is_b2b              BOOLEAN NOT NULL DEFAULT false,
    is_active           BOOLEAN NOT NULL DEFAULT true,
    created_at          TIMESTAMP NOT NULL DEFAULT current_timestamp(),
    created_by          STRING,
    updated_at          TIMESTAMP,
    updated_by          STRING
)
USING DELTA;
