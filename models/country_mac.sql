select
    code,
    {{ get_country_name(code) }} as country_name
from {{ source('s1_layer', 'COUNTRY') }}