select *, '{{greater_num(4,9)}}' greater_n
from {{ ref('add_2') }}