with

source as (

    select * from {{ source('eoir_raw', 'tbllookup_appln') }}

),

cleaned as (

    select
        {{ clean_varchar('strcode') }} as application_code,
        {{ clean_varchar('strdescription') }} as application_description,
        {{ clean_varchar('strallowedcasetypes') }} as allowed_case_types,
        {{ clean_varchar('stralloweddecisioncodes') }} as allowed_decision_codes,

        -- date
        case
            when datcreatedon ~ '^\d{4}-\d{2}-\d{2}'
                and left(datcreatedon, 4)::int > 1900
                then left(datcreatedon, 10)::date
        end as created_date

    from source

)

select * from cleaned