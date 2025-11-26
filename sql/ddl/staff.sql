
CREATE TABLE IF NOT EXISTS dim_staff (
    staff_id               INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),

    -- Business IDs
    hr_employee_code       STRING NOT NULL,  -- HR/ERP code
    staff_number           STRING,          -- badge / payroll
    external_ref_code      STRING,          -- cross-system

    -- Personal info
    first_name             STRING NOT NULL,
    middle_name            STRING,
    last_name              STRING NOT NULL,
    gender_id              INT,             -- logical FK → gender
    birthdate              DATE,
    national_id_number     STRING,
    email_corporate        STRING,
    email_personal         STRING,
    phone_mobile           STRING,
    phone_internal_ext     STRING,

    -- Employment details
    job_role_id            INT,             -- logical FK → job_role
    department_id          INT,             -- logical FK → department
    store_id               INT,             -- logical FK → store
    region_id              INT,             -- logical FK → region
    country_code           STRING,
    manager_staff_id       INT,             -- self-ref

    hire_date              DATE,
    termination_date       DATE,
    employment_status_id   INT,             -- logical FK → employment_status
    employment_type_id     INT,             -- logical FK → employment_type
    probation_end_date     DATE,
    contract_end_date      DATE,

    -- Work pattern
    default_shift_pattern  STRING,
    union_member_flag      BOOLEAN NOT NULL DEFAULT false,

    -- Status flags
    is_active              BOOLEAN NOT NULL DEFAULT true,
    is_store_based         BOOLEAN NOT NULL DEFAULT true,
    is_cash_handler        BOOLEAN NOT NULL DEFAULT false,

    -- Audit
    created_at             TIMESTAMP NOT NULL DEFAULT current_timestamp(),
    created_by             STRING,
    updated_at             TIMESTAMP,
    updated_by             STRING
)
USING DELTA;
