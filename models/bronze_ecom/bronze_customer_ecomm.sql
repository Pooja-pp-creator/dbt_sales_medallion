{{ config(materialized="table", schema="BRONZE_ECOMM") }}

with
    deduped as (
        select
            cast(customer_id as int) as customer_id,
            trim(customer_name) as customer_name,
            lower(trim(email)) as email,
            trim(country) as country,
            cast(created_at as timestamp) as created_at,
            cast(updated_at as timestamp) as updated_at,
            row_number() over (partition by customer_id order by updated_at desc) as rn
        from {{ source("raw_layer", "CUSTOMERS") }}
    )

select
    customer_id,
    customer_name,
    email,
    country,
    created_at,
    updated_at,
    current_timestamp() as src_ingested_at,
    md5(cast(customer_id as string) || coalesce(email, '')) as record_hash
from deduped
where rn = 1
