{# Greatest among 2 number using if else in macro#}
{% macro greater_num(num1, num2) %}
    {% if num1 > num2 %}
        Num 1 is greater
    {% else %}
        Num 2 is greater
    {% endif %}
{% endmacro %}
