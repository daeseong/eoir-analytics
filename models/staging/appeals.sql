with 

source as (

    select * from {{ source('eoir_raw', 'tblappeal') }}

),

cleaned as (

    select
        idnappeal,
        idncase,
        idnproceeding,

        -- codes
        {{ clean_varchar('strappealcategory') }} as appeal_category,
        {{ clean_varchar('strappealtype') }} as appeal_type,
        {{ clean_varchar('strfiledby') }} as filed_by,
        {{ clean_varchar('strbiadecision') }} as bia_decision_code,
        {{ clean_varchar('strbiadecisiontype') }} as bia_decision_type,
        {{ clean_varchar('strcasetype') }} as case_type_code,
        {{ clean_varchar('strlang') }} as language_code,
        {{ clean_varchar('strnat') }} as nationality_code,
        {{ clean_varchar('strproceedingihp') }} as ihp_code,
        {{ clean_varchar('strcustody') }} as custody_code,
        {{ clean_varchar('strprobono') }} as pro_bono_flag,

        -- dates: timestamp
        case 
            when datappealfiled ~ '^\d{4}-\d{2}-\d{2}'
                and left(datappealfiled, 4)::int > 1900
                then left(datappealfiled, 10)::date
        end as appeal_filed_date,

        case 
            when datattorneye27 ~ '^\d{4}-\d{2}-\d{2}'
                and left(datattorneye27, 4)::int > 1900
                then left(datattorneye27, 10)::date
        end as attorney_e27_date,

        case 
            when datbiadecision ~ '^\d{4}-\d{2}-\d{2}'
                and left(datbiadecision, 4)::int > 1900
                then left(datbiadecision, 10)::date
        end as bia_decision_date

    from source

)

select * from cleaned