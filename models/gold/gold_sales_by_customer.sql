select 
    customer_id,
    customer_name,
    customer_country,
    sum(quantity) as total_quantity,
    count(distinct sale_id) as total_orders
from {{ ref('silver_sales_enriched') }}
group by 1,2,3