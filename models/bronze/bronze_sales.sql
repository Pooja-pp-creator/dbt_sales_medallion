{{
    config(
        materialized='table'
    )
}}

select
    cast(sale_id as int) as sale_id,
    cast(customer_id as int) as customer_id,
    cast(product_id as int) as product_id,
    cast(quantity as int) as quantity,
    cast(sale_date as date) as sale_date
from {{ source('bronze_layer', 'SALES') }}
