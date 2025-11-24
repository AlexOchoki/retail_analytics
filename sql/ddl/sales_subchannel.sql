--- SALES Subchannel

CREATE TABLE IF NOT EXISTS sales_subchannel (
    sales_subchannel_id    INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    sales_subchannel_code  STRING NOT NULL,
    sales_subchannel_name  STRING NOT NULL,
    sales_channel_id       INT NOT NULL,  -- logical FK → sales_channel
    is_active              BOOLEAN NOT NULL DEFAULT true,
    created_at             TIMESTAMP NOT NULL DEFAULT current_timestamp(),
    created_by             STRING,
    updated_at             TIMESTAMP,
    updated_by             STRING
)
USING DELTA;
