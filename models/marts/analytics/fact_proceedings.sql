with

proceedings as (

    select * from {{ ref('proceedings') }}

),

appeals as (

    select * from {{ ref('appeals') }}

),

appeal_flags as (

    select distinct
        idnproceeding,
        true as has_appeal
    from appeals

),

final as (

    select

        -- primary keys
        p.idnproceeding,
        p.idncase,

        -- foreign keys → dimensions
        p.nationality_code,
        p.case_type_code,
        p.language_code,
        p.custody_code,
        p.base_city_code,
        p.judge_code,

        -- proceeding attributes
        p.decision_code,
        p.decision_type_code,
        p.appeal_reserved_code,
        p.other_completion_code,
        p.criminal_indicator_raw,

        -- dates
        case
            when p.osc_date <= current_date then p.osc_date
        end as filing_date,
        p.completion_date,
        p.hearing_date,
        p.absentia_date,

        -- processing time
        case
            when p.completion_date is not null
             and p.osc_date is not null
             and p.osc_date <= current_date
            then p.completion_date - p.osc_date
        end as processing_days,

        -- flag
        coalesce(a.has_appeal, false) as has_appeal

    from proceedings p
    left join appeal_flags a on p.idnproceeding = a.idnproceeding

)

select * from final