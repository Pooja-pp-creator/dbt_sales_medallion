{{
    config(
        materialized='table'
    )
}}

select 
cast(product_id as int) as product_id,
trim(product_name) as product_name,
trim(category) as product_category,
cast(price as number(10,2)) as product_price
from {{ source('bronze_layer', 'PRODUCTS') }}
where product_id is not null