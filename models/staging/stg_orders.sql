with source as (

    select * from {{ source('acme_raw', 'orders') }}

)

select
    order_id,
    nullif(customer_id, 'cus-0001') as customer_id,
    order_date,
    status,
    amount_cents as amount,
    currency
from source
