CREATE TABLE IF NOT EXISTS fact_sales (
    -- Surrogate key
    fact_sales_id          BIGINT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),

    -- Business keys
    sales_document_no      STRING NOT NULL,   -- receipt_no / order_id
    sales_line_no          INT    NOT NULL,   -- 1,2,3... per document

    -- Timestamps
    transaction_ts         TIMESTAMP NOT NULL,  -- local timestamp
    transaction_date       DATE      NOT NULL,  -- for easier date joins

    -- Foreign keys (logical)
    store_id               INT,                 -- logical FK → store
    sales_channel_id       INT NOT NULL,        -- logical FK → sales_channel
    sales_subchannel_id    INT,                 -- logical FK → sales_subchannel
    customer_id            INT,                 -- logical FK → dim_customer
    staff_id               INT,                 -- logical FK → dim_staff
    product_id             INT NOT NULL,        -- logical FK → product

    -- Financials
    quantity               DECIMAL(18,3) NOT NULL,
    unit_price             DECIMAL(18,4) NOT NULL,    -- selling price before discount
    gross_amount           DECIMAL(18,4) NOT NULL,    -- quantity * unit_price

    discount_amount        DECIMAL(18,4) NOT NULL DEFAULT 0,
    tax_amount             DECIMAL(18,4) NOT NULL DEFAULT 0,
    net_amount             DECIMAL(18,4) NOT NULL,    -- (gross - discount + tax)

    -- Cost / margin (optional but very useful)
    unit_cost              DECIMAL(18,4),             -- standard / moving average cost
    cost_of_goods_sold     DECIMAL(18,4),             -- quantity * unit_cost
    gross_margin_amount    DECIMAL(18,4),             -- net_amount - COGS
    gross_margin_pct       DECIMAL(9,4),              -- gross_margin_amount / net_amount

    -- Extra attributes
    promotion_code         STRING,
    is_refund              BOOLEAN NOT NULL DEFAULT false,  -- returns / negative sales
    is_online_order        BOOLEAN NOT NULL DEFAULT false,
    is_click_and_collect   BOOLEAN NOT NULL DEFAULT false,

    -- Data lineage
    record_source          STRING,       -- 'POS_SIM', 'ECOM_SIM', etc.
    load_batch_id          STRING,
    created_at             TIMESTAMP NOT NULL DEFAULT current_timestamp(),
    created_by             STRING,
    updated_at             TIMESTAMP,
    updated_by             STRING
)
USING DELTA;
