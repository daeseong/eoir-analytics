with

source as (

    select * from {{ source('eoir_raw', 'tbllookupbasecity') }}

),

cleaned as (

    select
        {{ clean_varchar('base_city_code') }} as base_city_code,
        {{ clean_varchar('base_city_name') }} as court_name,
        {{ clean_varchar('base_st_address') }} as street_address,
        {{ clean_varchar('base_city') }} as city,
        {{ clean_varchar('base_state') }} as state,
        {{ clean_varchar('base_zip_1') }} as zip_code,
        {{ clean_varchar('strregion') }} as region_code,

        -- bool
        case trim(blnactive)
            when '1' then true
            when '0' then false
            else null
        end as is_active

    from source

)

select * from cleaned