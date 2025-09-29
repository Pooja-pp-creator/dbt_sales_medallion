{{
    config(
        materialized='table',
        transient=false,
        alias='"Employee Dtls T"'
    )
}}

select 1 as id,'pooja' as name