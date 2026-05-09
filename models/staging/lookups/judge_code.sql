with

source as (

    select * from {{ source('eoir_raw', 'tbllookupjudge') }}

),

cleaned as (

    select
        {{ clean_varchar('judge_code') }} as judge_code,
        {{ clean_varchar('judge_name') }} as judge_name,
        {{ clean_varchar('judge_city') }} as city,
        {{ clean_varchar('judge_state') }} as state,

        -- bool
        case trim(blnactive)
            when '1' then true
            when '0' then false
            else null
        end as is_active

    from source

)

select * from cleaned