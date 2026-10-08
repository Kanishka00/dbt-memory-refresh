{% macro register_bronze() %}

    {% do run_query('CREATE SCHEMA IF NOT EXISTS bronze') %}

    {%set sql %}
        CREATE OR REPLACE VIEW bronze.customers AS

        SELECT *
        FROM read_csv_auto('{{ env_var("BRONZE_CSV_PATH") }}', header=True)
    {%endset%}

    {% do run_query(sql) %}

{% endmacro %}