with 

source as (

    select * from {{ source('eoir_raw', 'a_tblcaseidentifier') }}

),

cleaned as (

    select
        idncaseid,
        idncase,
        {{ clean_varchar('case_id') }} as case_id_code

    from source

)

select * from cleaned