{% macro export_silver() %}

    {% set csv_path = env_var('SILVER_CSV_PATH') %}

    {% set sql %}

        COPY (
            SELECT *
            FROM {{ ref('silver_customers') }}
            ORDER BY customer_id
        )
        TO '{{ csv_path | replace("'", "''") }}'
        (HEADER, DELIMITER ',')

    {% endset %}

    {% do run_query(sql) %}

    {{ log("Silver CSV exported successfully", info=True) }}

{% endmacro %}