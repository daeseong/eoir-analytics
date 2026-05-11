with

appeals as (

    select * from {{ ref('appeals') }}

),

final as (

    select

        -- primary keys
        idnappeal,
        idncase,
        idnproceeding,

        -- foreign keys → dimensions
        nationality_code,
        case_type_code,
        language_code,
        custody_code,

        -- appeal attributes
        appeal_category,
        appeal_type,
        filed_by,
        bia_decision_code,
        bia_decision_type,
        ihp_code,

        -- dates
        appeal_filed_date,
        bia_decision_date,

        -- processing time
        case
            when bia_decision_date is not null
             and appeal_filed_date is not null
            then bia_decision_date - appeal_filed_date
        end as days_to_bia_decision,

        -- flag
        coalesce(pro_bono_flag = 'Y', false) as is_pro_bono

    from appeals

)

select * from final