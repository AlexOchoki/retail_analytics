

CREATE TABLE IF NOT EXISTS tax_group (
    tax_group_id   INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    tax_group_code STRING NOT NULL,   -- VAT16, ZERO, EXEMPT
    tax_group_name STRING NOT NULL,
    tax_rate_pct   DECIMAL(5,2) NOT NULL,
    is_active      BOOLEAN NOT NULL DEFAULT true,
    created_at     TIMESTAMP NOT NULL DEFAULT current_timestamp(),
    created_by     STRING,
    updated_at     TIMESTAMP,
    updated_by     STRING
)
USING DELTA;

