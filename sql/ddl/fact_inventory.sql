CREATE TABLE IF NOT EXISTS fact_inventory_movement (
    inventory_movement_id  BIGINT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),

    -- Business keys
    movement_document_no   STRING NOT NULL,   -- PO, GRN, TRANSFER NO, ADJ NO...
    movement_line_no       INT    NOT NULL,

    -- Timestamps
    movement_ts            TIMESTAMP NOT NULL,
    movement_date          DATE      NOT NULL,

    -- Foreign keys (logical)
    store_id               INT NOT NULL,      -- logical FK → store
    product_id             INT NOT NULL,      -- logical FK → product
    supplier_id            INT,              -- logical FK → supplier (for purchases) 
    staff_id               INT,              -- who posted the movement
    sales_channel_id       INT,              -- if movement is tied to a channel

    -- Movement type & quantities
    movement_type          STRING NOT NULL,   -- 'PURCHASE', 'SALE', 'RETURN', 'TRANSFER_IN', 'TRANSFER_OUT', 'ADJUSTMENT', 'WRITE_OFF'
    quantity_in            DECIMAL(18,3) NOT NULL DEFAULT 0,
    quantity_out           DECIMAL(18,3) NOT NULL DEFAULT 0,

    -- Costs
    unit_cost              DECIMAL(18,4),
    movement_cost_value    DECIMAL(18,4),     -- (quantity_in - quantity_out) * unit_cost

    -- Optional link back to sales line
    fact_sales_id          BIGINT,            -- logical FK → fact_sales.fact_sales_id

    -- Data lineage
    record_source          STRING,
    load_batch_id          STRING,
    created_at             TIMESTAMP NOT NULL DEFAULT current_timestamp(),
    created_by             STRING,
    updated_at             TIMESTAMP,
    updated_by             STRING
)
USING DELTA;

