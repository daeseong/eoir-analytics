with

source as (

    select * from {{ source('eoir_raw', 'tbllookupfiledby') }}

),

cleaned as (

    select
        {{ clean_varchar('strcode') }} as filed_by_code,
        {{ clean_varchar('strdescription') }} as filed_by_description,

        -- bool
        case trim(blnactive)
            when '1' then true
            when '0' then false
            else null
        end as is_active

    from source

)

select * from cleaned