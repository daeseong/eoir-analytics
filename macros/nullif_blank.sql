{% macro clean_varchar(col) %}
    nullif(trim({{ col }}), '')
{% endmacro %}