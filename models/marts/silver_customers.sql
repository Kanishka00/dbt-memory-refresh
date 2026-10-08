{{ config(materialized='table') }}

SELECT
    customer_id,
    full_name,
    email,
    total_spend,
    customer_category

FROM {{ ref('int_customers') }}

WHERE status = 'active'