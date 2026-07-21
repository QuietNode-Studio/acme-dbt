{{ config(materialized='table') }}

-- Calendar spine MetricFlow requires for time-based metrics. Covers the seeded
-- order window (Jul 2025 – Jul 2026) with a year of slack either side.
with days as (

    select dateadd(day, seq4(), '2024-07-01'::date) as date_day
    from table (generator(rowcount => 1096))

)

select date_day
from days
