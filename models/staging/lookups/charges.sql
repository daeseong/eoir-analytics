with

source as (

    select * from {{ source('eoir_raw', 'tbllookupcharges') }}

),

cleaned as (

    select
        {{ clean_varchar('strcode') }} as charge_code,
        {{ clean_varchar('strcodestring') }} as charge_code_string,
        {{ clean_varchar('strcodedescription') }} as charge_description,
        {{ clean_varchar('applicable_case_type1') }} as applicable_case_type_1,
        {{ clean_varchar('applicable_case_type2') }} as applicable_case_type_2,
        {{ clean_varchar('applicable_case_type3') }} as applicable_case_type_3,

        case trim(criminal_flag)
            when '1' then true
            when '0' then false
            else null
        end as is_criminal,

        case trim(aggravate_felon)
            when '1' then true
            when '0' then false
            else null
        end as is_aggravated_felon,

        case trim(blnactive)
            when '1' then true
            when '0' then false
            else null
        end as is_active

    from source

)

select * from cleaned