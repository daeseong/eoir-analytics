with

source as (

    select * from {{ source('eoir_raw', 'tbllookupbiadecision') }}

),

cleaned as (

    select
        {{ clean_varchar('strcode') }} as bia_decision_code,
        {{ clean_varchar('strdescription') }} as bia_decision_description,

        case trim(blnactive)
            when '1' then true
            when '0' then false
            else null
        end as is_active

    from source

)

select * from cleaned