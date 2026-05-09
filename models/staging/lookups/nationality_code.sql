with

source as (

    select * from {{ source('eoir_raw', 'tbllookupnationality') }}

),

cleaned as (

    select
        {{ clean_varchar('nat_code') }} as nationality_code,
        {{ clean_varchar('nat_name') }} as nationality_name,
        {{ clean_varchar('nat_country_name') }} as country_name,

        -- bool
        case trim(blnactive)
            when '1' then true
            when '0' then false
            else null
        end as is_active

    from source

)

select * from cleaned