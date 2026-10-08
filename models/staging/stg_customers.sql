{{ config(materialized='view') }}

SELECT
    CAST(customer_id AS INTEGER) AS customer_id,

    TRIM(first_name) AS first_name,

    TRIM(last_name) AS last_name,

    LOWER(TRIM(email)) AS email,

    LOWER(TRIM(status)) AS status,

    CAST(total_spend AS DECIMAL(18,2)) AS total_spend

FROM {{ source('bronze', 'customers') }}