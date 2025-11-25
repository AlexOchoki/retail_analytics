
CREATE TABLE IF NOT EXISTS dim_customer (
    -- Surrogate key
    customer_id              INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),

    -- Business/system identifiers
    crm_customer_code        STRING NOT NULL,  -- CRM/ERP ID
    loyalty_card_number      STRING,
    national_id_number       STRING,
    external_ref_code        STRING,

    -- Personal info
    first_name               STRING NOT NULL,
    middle_name              STRING,
    last_name                STRING NOT NULL,
    gender_id                INT,             -- logical FK → gender
    birthdate                DATE,
    marital_status           STRING,
    occupation               STRING,
    household_size           INT,
    dependents_count         INT,

    -- Contact info
    email_primary            STRING,
    email_secondary          STRING,
    phone_mobile             STRING,
    phone_home               STRING,
    whatsapp_number          STRING,

    -- Address
    street_address_1         STRING,
    street_address_2         STRING,
    city                     STRING,
    postal_code              STRING,
    region_id                INT,            -- logical FK → region
    country_code             STRING,         -- ISO alpha-3

    -- Registration & lifecycle
    registration_date        DATE,
    registration_channel_id  INT,           -- logical FK → sales_channel
    first_purchase_date      DATE,
    last_purchase_date       DATE,

    customer_segment_id      INT,           -- logical FK → customer_segment
    loyalty_tier_id          INT,           -- logical FK → loyalty_tier
    is_loyalty_member        BOOLEAN NOT NULL DEFAULT false,

    -- Preferences & consents
    marketing_opt_in_email    BOOLEAN NOT NULL DEFAULT false,
    marketing_opt_in_sms      BOOLEAN NOT NULL DEFAULT false,
    marketing_opt_in_whatsapp BOOLEAN NOT NULL DEFAULT false,
    preferred_language        STRING,
    preferred_contact_time    STRING,

    -- Status flags
    is_active                BOOLEAN NOT NULL DEFAULT true,
    deactivation_date        DATE,
    deactivation_reason      STRING,
    is_blacklisted           BOOLEAN NOT NULL DEFAULT false,
    blacklist_reason         STRING,

    -- Audit
    created_at               TIMESTAMP NOT NULL DEFAULT current_timestamp(),
    created_by               STRING,
    updated_at               TIMESTAMP,
    updated_by               STRING
)
USING DELTA;
