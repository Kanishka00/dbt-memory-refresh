{{ config(materialized='view') }}

SELECT
    customer_id,

    first_name || ' ' || last_name AS full_name,

    email,
    status,
    total_spend,

    {{ customer_category('total_spend') }} AS customer_category

FROM {{ ref('stg_customers') }}