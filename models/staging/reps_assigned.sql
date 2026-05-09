with 

source as (

    select * from {{ source('eoir_raw', 'tbl_repsassigned') }}

),

cleaned as (

    select
        idnrepsassigned,
        idncase,

        {{ clean_varchar('strattylevel') }} as attorney_level,
        {{ clean_varchar('strattytype') }} as attorney_type,
        {{ clean_varchar('parent_table') }} as parent_table,
        {{ clean_varchar('parent_idn') }} as parent_idn,
        {{ clean_varchar('base_city_code') }} as base_city_code,

        -- bool
        case trim(blnprimeatty)
            when '1' then true
            when '0' then false
            else null
        end as is_primary_attorney,

        -- dates: timestamp
        case 
            when ins_ta_date_assigned ~ '^\d{4}-\d{2}-\d{2}'
                and left(ins_ta_date_assigned, 4)::int > 1900
                then left(ins_ta_date_assigned, 10)::date
        end as ins_date_assigned,

        case 
            when e_27_date ~ '^\d{4}-\d{2}-\d{2}'
                and left(e_27_date, 4)::int > 1900
                then left(e_27_date, 10)::date
        end as e27_date,

        case 
            when e_28_date ~ '^\d{4}-\d{2}-\d{2}'
            and left(e_28_date, 4)::int > 1900
            then left(e_28_date, 10)::date
        end as e28_date

    from source

)

select * from cleaned