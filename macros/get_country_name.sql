{% macro get_country_name(column_name) %}
    case
        when {{ column_name }} = '0001' then 'india'
        when {{ column_name }} = '0002' then 'usa'
        else 'unknown'
    end
{% endmacro %}