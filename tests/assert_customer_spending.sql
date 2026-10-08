SELECT
    customer_id,
    total_spend

FROM {{ ref('silver_customers') }}

WHERE total_spend < 0