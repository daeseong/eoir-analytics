with

base_city as (

    select * from {{ ref('city_code') }}

),

final as (

    select
        base_city_code,
        court_name,
        city,
        state,
        zip_code,
        region_code,
        is_active

    from base_city

)

select * from final