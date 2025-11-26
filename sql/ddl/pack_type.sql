
CREATE TABLE IF NOT EXISTS pack_type (
    pack_type_id   INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    pack_type_code STRING NOT NULL, -- BOTTLE, CAN, BOX
    pack_type_name STRING NOT NULL,
    is_active      BOOLEAN NOT NULL DEFAULT true,
    created_at     TIMESTAMP NOT NULL DEFAULT current_timestamp(),
    created_by     STRING,
    updated_at     TIMESTAMP,
    updated_by     STRING
)
USING DELTA;
