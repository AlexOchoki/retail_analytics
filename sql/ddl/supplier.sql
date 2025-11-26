

CREATE TABLE IF NOT EXISTS supplier (
    supplier_id   INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    supplier_code STRING NOT NULL,
    supplier_name STRING NOT NULL,
    contact_email STRING,
    contact_phone STRING,
    country_code  STRING,
    is_active     BOOLEAN NOT NULL DEFAULT true,
    created_at    TIMESTAMP NOT NULL DEFAULT current_timestamp(),
    created_by    STRING,
    updated_at    TIMESTAMP,
    updated_by    STRING
)
USING DELTA;
