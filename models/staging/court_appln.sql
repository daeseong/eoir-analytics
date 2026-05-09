with 

source as (

    select * from {{ source('eoir_raw', 'tbl_court_appln') }}

),

cleaned as (

    select
        idnproceedingappln,
        idncase,

        {{ clean_varchar('appl_code') }}             as application_code,
        {{ clean_varchar('appl_dec') }}              as application_decision,

        case 
            when appl_recd_date ~ '^\d{4}-\d{2}-\d{2}'
                and left(appl_recd_date, 4)::int > 1900
                then left(appl_recd_date, 10)::date
        end as application_received_date

    from source

)

select * from cleaned