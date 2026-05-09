with

source as (

    select * from {{ source('eoir_raw', 'tbllookupcustodystatus') }}

),

cleaned as (

    select
        {{ clean_varchar('strcode') }} as custody_code,
        {{ clean_varchar('strdescription') }} as custody_description,

        -- bool
        case trim(blnactive)
            when '1' then true
            when '0' then false
            else null
        end as is_active

    from source

)

select * from cleaned