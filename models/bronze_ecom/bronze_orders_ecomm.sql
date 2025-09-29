{{ config(materialized="table", schema="BRONZE_ECOMM") }}

with
    deduped as (
        select
            cast(order_id as int) as order_id,
            cast(customer_id as int) as customer_id,
            cast(order_date as date) as order_date,
            upper(trim(order_status)) as order_status,
            trim(channel) as channel,
            nullif(trim(promo_code), '') as promo_code,
            upper(currency) as currency,
            cast(shipping_cost as numeric(12, 2)) as shipping_cost,
            row_number() over (partition by order_id order by order_date desc) as rn
        from {{ source("raw_layer", "ORDERS") }}
    )

select
    order_id,
    customer_id,
    order_date,
    order_status,
    channel,
    promo_code,
    currency,
    shipping_cost,
    current_timestamp() as src_ingested_at,
    md5(cast(order_id as string) || coalesce(order_status, '')) as record_hash
from deduped
where rn = 1
