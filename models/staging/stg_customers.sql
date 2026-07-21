with source as (

    select * from {{ source('acme_raw', 'customers') }}

)

select
    customer_id,
    email,
    full_name,
    signed_up_on,
    segment
from source
