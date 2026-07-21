with orders as (

    select * from {{ ref('stg_orders') }}

),

customers as (

    select * from {{ ref('stg_customers') }}

)

select
    orders.order_id,
    orders.customer_id,
    customers.segment as customer_segment,
    orders.order_date,
    orders.status,
    orders.amount,
    orders.currency,
    orders.status in ('delivered', 'shipped') as is_fulfilled
from orders
left join customers using (customer_id)
