with

nationality as (

    select * from {{ ref('nationality_code') }}

),

final as (

    select
        nationality_code,
        nationality_name,
        country_name,
        is_active

    from nationality

)

select * from final