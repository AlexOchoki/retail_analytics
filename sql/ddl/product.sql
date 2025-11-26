
CREATE TABLE IF NOT EXISTS product (
    product_id           INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),

    product_code         STRING NOT NULL,  -- business SKU
    product_name         STRING NOT NULL,
    product_short_name   STRING,
    product_description  STRING,

    barcode_gtin         STRING,          -- EAN/UPC/GTIN
    internal_item_code   STRING,

    brand_id             INT,
    category_id          INT,
    subcategory_id       INT,
    uom_base_id          INT,
    pack_type_id         INT,
    lifecycle_status_id  INT,
    tax_group_id         INT,

    -- pack / size
    net_content_qty      DECIMAL(18,3),
    net_content_uom_id   INT,             -- logical FK → uom
    pack_size_units      INT,

    -- lifecycle and status
    is_active            BOOLEAN NOT NULL DEFAULT true,
    launch_date          DATE,
    discontinue_date     DATE,
    status_reason        STRING,

    created_at           TIMESTAMP NOT NULL DEFAULT current_timestamp(),
    created_by           STRING,
    updated_at           TIMESTAMP,
    updated_by           STRING
)
USING DELTA;
