with

source as (

    select * from {{ source('eoir_raw', 'tbllookup_casepriority') }}

),

cleaned as (

    select
        {{ clean_varchar('strcode') }} as case_priority_code,
        {{ clean_varchar('strdescription') }} as case_priority_name,
        {{ clean_varchar('strdays') }} as target_days,

        -- bool
        case trim(blnbypasscal)
            when '1' then true
            when '0' then false
            else null
        end as bypass_calendar,

        case trim(blnactive)
            when '1' then true
            when '0' then false
            else null
        end as is_active

    from source

)

select * from cleaned