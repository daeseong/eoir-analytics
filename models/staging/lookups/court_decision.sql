with

source as (

    select * from {{ source('eoir_raw', 'tblookupcourtdecision') }}

),

cleaned as (

    select
        {{ clean_varchar('strcasetype') }} as case_type_code,
        {{ clean_varchar('strdeccode') }} as decision_code,
        {{ clean_varchar('strdecdescription') }} as decision_description,
        {{ clean_varchar('strdectype') }} as decision_type,
        {{ clean_varchar('strfinaldisposition') }} as final_disposition,

        -- bool
        case trim(blnactive)
            when '1' then true
            when '0' then false
            else null
        end as is_active

    from source

)

select * from cleaned