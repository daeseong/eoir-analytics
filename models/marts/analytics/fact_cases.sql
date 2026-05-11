with

cases as (

    select * from {{ ref('cases') }}

),

proceedings as (

    select * from {{ ref('proceedings') }}

),

reps as (

    select * from {{ ref('reps_assigned') }}

),

latest_proceeding as (

    select *
    from (
        select
            *,
            row_number() over (
                partition by idncase
                order by completion_date desc nulls last, idnproceeding desc
            ) as rn
        from proceedings
    ) ranked
    where rn = 1

),

rep_flags as (

    select distinct
        idncase,
        true as has_representation
    from reps

),

appeal_flags as (

    select distinct
        idncase,
        true as has_appeal
    from {{ ref('appeals') }}

),

final as (

    select

        -- primary key
        c.idncase,

        -- foreign keys → dimensions
        c.nationality_code,
        c.case_type_code,
        c.language_code,
        c.custody_code,
        lp.idnproceeding as latest_proceeding_id,
        lp.base_city_code,
        lp.judge_code,

        -- case attributes
        c.sex,
        c.birth_month,
        c.birth_year,
        c.site_type_code,
        c.case_priority_code,
        c.date_of_entry,

        -- dates
        case
            when lp.osc_date <= current_date then lp.osc_date
        end as filing_date,
        lp.completion_date,

        -- processing time
        case
            when lp.completion_date is not null
             and lp.osc_date is not null
             and lp.osc_date <= current_date
            then lp.completion_date - lp.osc_date
        end as processing_days,

        -- decision from most recent proceeding
        lp.decision_code,
        lp.decision_type_code,

        -- flags
        coalesce(r.has_representation, false) as has_representation,
        coalesce(af.has_appeal, false) as has_appeal

    from cases c
    left join latest_proceeding lp on c.idncase = lp.idncase
    left join rep_flags r on c.idncase = r.idncase
    left join appeal_flags af on c.idncase = af.idncase

)

select * from final