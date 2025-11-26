
CREATE TABLE IF NOT EXISTS store (
    store_id            INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    store_code          STRING NOT NULL,
    store_name          STRING NOT NULL,
    sales_channel_id    INT NOT NULL,   -- logical FK → sales_channel
    sales_subchannel_id INT,           -- logical FK → sales_subchannel
    region_id           INT,           -- logical FK → region
    city                STRING,
    address_line1       STRING,
    address_line2       STRING,
    latitude            DECIMAL(9,6),
    longitude           DECIMAL(9,6),
    opening_date        DATE,
    closing_date        DATE,
    is_active           BOOLEAN NOT NULL DEFAULT true,
    created_at          TIMESTAMP NOT NULL DEFAULT current_timestamp(),
    created_by          STRING,
    updated_at          TIMESTAMP,
    updated_by          STRING
)
USING DELTA;
