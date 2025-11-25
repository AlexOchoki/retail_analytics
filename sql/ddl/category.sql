
CREATE TABLE IF NOT EXISTS category (
    category_id   INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    category_code STRING NOT NULL,
    category_name STRING NOT NULL,
    is_active     BOOLEAN NOT NULL DEFAULT true,
    created_at    TIMESTAMP NOT NULL DEFAULT current_timestamp(),
    created_by    STRING,
    updated_at    TIMESTAMP,
    updated_by    STRING
)
USING DELTA;
