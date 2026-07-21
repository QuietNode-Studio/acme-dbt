with source as (

    select * from {{ source('acme_raw', 'orders') }}

)

select
    order_id,
    customer_id,
    order_date,
    status,
    round(amount_cents / 100.0, 2) as amount,
    currency
from source
