CREATE TABLE IF NOT EXISTS fact_staff_shift (
    staff_shift_id          BIGINT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),

    -- Keys / grain
    shift_date              DATE      NOT NULL,
    staff_id                INT       NOT NULL,   -- logical FK → dim_staff
    store_id                INT       NOT NULL,   -- logical FK → store
    sales_channel_id        INT,                  -- logical FK → sales_channel
    sales_subchannel_id     INT,                  -- logical FK → sales_subchannel

    -- Shift details
    shift_code              STRING,               -- EARLY, LATE, NIGHT, etc.
    scheduled_start_ts      TIMESTAMP,
    scheduled_end_ts        TIMESTAMP,
    actual_start_ts         TIMESTAMP,
    actual_end_ts           TIMESTAMP,

    hours_scheduled         DECIMAL(9,2),
    hours_worked            DECIMAL(9,2),
    overtime_hours          DECIMAL(9,2),

    -- Performance metrics (can be loaded from aggregations of fact_sales)
    total_sales_amount      DECIMAL(18,4),
    total_transactions      INT,
    avg_basket_value        DECIMAL(18,4),
    items_per_transaction   DECIMAL(9,3),

    -- HR metrics
    is_absent               BOOLEAN NOT NULL DEFAULT false,
    absence_reason          STRING,

    -- Data lineage
    record_source           STRING,
    load_batch_id           STRING,
    created_at              TIMESTAMP NOT NULL DEFAULT current_timestamp(),
    created_by              STRING,
    updated_at              TIMESTAMP,
    updated_by              STRING
)
USING DELTA;
