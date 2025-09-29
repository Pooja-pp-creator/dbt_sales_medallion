{{
    config(
        materialized='view'
    )
}}

with ord as(
select id as order_id,
       user_id as customer_id,
       cast(order_date as timestamp) as order_date,
       status as status_new
       from {{ source('practice_dbt', 'orders') }} 
)
select * from ord
where customer_id is not null