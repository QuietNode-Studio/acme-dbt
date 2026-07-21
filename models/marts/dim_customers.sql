with customers as (

    select * from {{ ref('stg_customers') }}

),

orders as (

    select * from {{ ref('stg_orders') }}

)

select
    customers.customer_id,
    customers.full_name,
    customers.segment,
    customers.signed_up_on,
    count(orders.order_id) as lifetime_orders,
    coalesce(sum(orders.amount), 0) as lifetime_value
from customers
left join orders using (customer_id)
group by 1, 2, 3, 4
