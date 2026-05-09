with 

source as (

    select * from {{ source('eoir_raw', 'b_tblproceedcharges') }}

),

cleaned as (

    select
        idnprcdchg,
        idncase,
        idnproceeding,

        {{ clean_varchar('charge') }} as charge_code,
        {{ clean_varchar('chg_status') }} as charge_status

    from source

)

select * from cleaned