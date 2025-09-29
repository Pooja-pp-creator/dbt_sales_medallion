{{ config(materialized="table", alias="customers_stg_test", query_tag="cust") }}

select id, concat(fname, ' ', lname) as full_name
from {{ source('practice_dbt', 'customers') }}
qualify row_number() over (partition by id order by id) = 1
