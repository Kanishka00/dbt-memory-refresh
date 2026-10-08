{% macro customer_category(column_name) %}

    CASE
        WHEN {{ column_name }} >= 100000 THEN 'PLATINUM'
        WHEN {{ column_name }} >= 50000 THEN 'GOLD'
        ELSE 'SILVER'
    END

{% endmacro %}