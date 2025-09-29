{% macro generate_database_name(database_name,node) %}   

    {% if database_name is not none %}
        {{database_name}}
    {% else %}
        {{target.database}}
    {% endif %}
    
{% endmacro %}  