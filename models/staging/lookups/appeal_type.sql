with

source as (

    select * from {{ source('eoir_raw', 'tbllookupappealtype') }}

),

cleaned as (

    select
        {{ clean_varchar('strapplcode') }} as appeal_type_code,
        {{ clean_varchar('strappldescription') }} as appeal_type_name,

        -- bool
        case trim(blnddappeal)
            when '1' then true
            when '0' then false
            else null
        end as is_dd_appeal,

        case trim(blnactive)
            when '1' then true
            when '0' then false
            else null
        end as is_active

    from source

)

select * from cleaned