
CREATE TABLE IF NOT EXISTS gender (
    gender_id   INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    gender_code STRING NOT NULL,   -- M, F, NB, U
    gender_name STRING NOT NULL,   -- Male, Female, Non-binary, Unknown
    is_active   BOOLEAN NOT NULL DEFAULT true,
    created_at  TIMESTAMP NOT NULL DEFAULT current_timestamp(),
    created_by  STRING,
    updated_at  TIMESTAMP,
    updated_by  STRING
)
USING DELTA;
