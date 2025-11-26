
CREATE TABLE IF NOT EXISTS product_supplier (
    product_id      INT NOT NULL,   -- logical FK → product
    supplier_id     INT NOT NULL,   -- logical FK → supplier

    supplier_sku    STRING,
    lead_time_days  INT,
    is_primary      BOOLEAN NOT NULL DEFAULT false,
    is_active       BOOLEAN NOT NULL DEFAULT true,

    created_at      TIMESTAMP NOT NULL DEFAULT current_timestamp(),
    created_by      STRING,
    updated_at      TIMESTAMP,
    updated_by      STRING
)
USING DELTA;
