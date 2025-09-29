{{
    config(
        query_tag ='DBT_SILVER'
    )
}}

select 
    s.sale_id,
    s.sale_date,
    c.customer_id,
    c.customer_name,
    c.customer_country,
    p.product_id,
    p.product_name,
    p.product_category,
    s.quantity
from {{ ref('bronze_sales') }} s
join {{ ref('bronze_customers') }} c on s.customer_id = c.customer_id
join {{ ref('bronze_products') }} p on s.product_id = p.product_id
