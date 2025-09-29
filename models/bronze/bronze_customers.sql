{{
    config(
        materialized='table',
        schema='BRONZE',
        query_tag= 'Customer_bronze'
    )
}}

select 
    cast(customer_id as int) as customer_id,
    trim(customer_name) as customer_name,
    trim(email) as customer_email,
    trim(country) as customer_country
 from {{ source('bronze_layer', 'CUSTOMERS') }}
 where customer_id is not null