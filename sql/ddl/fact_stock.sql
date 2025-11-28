CREATE TABLE IF NOT EXISTS fact_stock_snapshot (
    stock_snapshot_id       BIGINT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),

    snapshot_date           DATE NOT NULL,
    store_id                INT  NOT NULL,          -- logical FK → store
    product_id              INT  NOT NULL,          -- logical FK → product

    -- Stock levels
    stock_on_hand_qty       DECIMAL(18,3) NOT NULL DEFAULT 0,
    stock_reserved_qty      DECIMAL(18,3) NOT NULL DEFAULT 0,
    stock_available_qty     DECIMAL(18,3) NOT NULL DEFAULT 0,

    -- Valuation
    avg_unit_cost           DECIMAL(18,4),
    stock_cost_value        DECIMAL(18,4),         -- stock_on_hand_qty * avg_unit_cost

    -- Planning helpers (optional)
    reorder_point_qty       DECIMAL(18,3),
    safety_stock_qty        DECIMAL(18,3),

    -- Data lineage
    record_source           STRING,
    load_batch_id           STRING,
    created_at              TIMESTAMP NOT NULL DEFAULT current_timestamp(),
    created_by              STRING,
    updated_at              TIMESTAMP,
    updated_by              STRING
)
USING DELTA;
