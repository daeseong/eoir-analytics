with 

source as (

    select * from {{ source('eoir_raw', 'tbl_casepriorityhistory') }}

),

cleaned as (

    select
        idncaseprihistory,
        idncase,

        {{ clean_varchar('casepriority_code') }}     as case_priority_code,

        -- dates: cast date
        case 
            when datcreatedon ~ '^\d{4}-\d{2}-\d{2}'
                and left(datcreatedon, 4)::int > 1900
                then left(datcreatedon, 10)::date
        end as created_date,

        case 
            when datmodifiedon ~ '^\d{4}-\d{2}-\d{2}'
                and left(datmodifiedon, 4)::int > 1900
                then left(datmodifiedon, 10)::date
        end as modified_date

    from source

)

select * from cleaned