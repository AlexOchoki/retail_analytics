

CREATE TABLE IF NOT EXISTS subcategory (
    subcategory_id   INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    subcategory_code STRING NOT NULL,
    subcategory_name STRING NOT NULL,
    category_id      INT NOT NULL,   -- logical FK → category
    is_active        BOOLEAN NOT NULL DEFAULT true,
    created_at       TIMESTAMP NOT NULL DEFAULT current_timestamp(),
    created_by       STRING,
    updated_at       TIMESTAMP,
    updated_by       STRING
)
USING DELTA;
