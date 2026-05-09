with

source as (

    select * from {{ source('eoir_raw', 'tbllookupcasetype') }}

),

cleaned as (

    select
        {{ clean_varchar('strcode') }} as case_type_code,
        {{ clean_varchar('strdescription') }} as case_type_name,
        {{ clean_varchar('stransircode') }} as ansir_code,

        -- bool
        case trim(blnactive)
            when '1' then true
            when '0' then false
            else null
        end as is_active

    from source

)

select * from cleaned