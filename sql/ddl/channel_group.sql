--- I intend to use the Fabric notebooks to implement this
--- Spark SQL + Delta to implement the tables 
--1. CHANNEL GROUP

CREATE TABLE IF NOT EXISTS channel_group (
    channel_group_id   INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    channel_group_code STRING NOT NULL, -- PHYSICAL, DIGITAL, B2B
    channel_group_name STRING NOT NULL,
    description        STRING,
    is_active          BOOLEAN NOT NULL DEFAULT true,
    created_at         TIMESTAMP NOT NULL DEFAULT current_timestamp(),
    created_by         STRING,
    updated_at         TIMESTAMP,
    updated_by         STRING
)
USING DELTA;
