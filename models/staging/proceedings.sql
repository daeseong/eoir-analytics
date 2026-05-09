with 

source as (

    select * from {{ source('eoir_raw', 'b_tblproceeding') }}

),

cleaned as (

    select
        idnproceeding,
        idncase,

        -- lookup codes
        {{ clean_varchar('base_city_code') }} as base_city_code,
        {{ clean_varchar('hearing_loc_code') }} as hearing_loc_code,
        {{ clean_varchar('ij_code') }} as judge_code,
        {{ clean_varchar('prev_hearing_loc') }} as prev_hearing_loc_code,
        {{ clean_varchar('prev_hearing_base') }} as prev_hearing_base_code,
        {{ clean_varchar('prev_ij_code') }} as prev_judge_code,
        {{ clean_varchar('scheduled_hear_loc') }} as scheduled_hearing_loc_code,
        {{ clean_varchar('dec_type') }} as decision_type_code,
        {{ clean_varchar('dec_code') }} as decision_code,
        {{ clean_varchar('nat') }} as nationality_code,
        {{ clean_varchar('lang') }} as language_code,
        {{ clean_varchar('custody') }} as custody_code,
        {{ clean_varchar('case_type') }} as case_type_code,
        {{ clean_varchar('correctional_fac') }} as correctional_facility,
        {{ clean_varchar('transfer_to') }} as transfer_to_code,
        {{ clean_varchar('transfer_status') }} as transfer_status_code,
        {{ clean_varchar('trans_nbr') }} as transfer_number,

        -- status codes
        {{ clean_varchar('appeal_rsvd') }} as appeal_reserved_code,
        {{ clean_varchar('appeal_not_filed') }} as appeal_not_filed_code,
        {{ clean_varchar('other_comp') }} as other_completion_code,
        {{ clean_varchar('crim_ind') }} as criminal_indicator_raw,
        {{ clean_varchar('deported_1') }} as deported_1_code,
        {{ clean_varchar('deported_2') }} as deported_2_code,
        {{ clean_varchar('ihp') }} as ihp_code,
        {{ clean_varchar('aggravate_felon') }} as aggravated_felon_code,
        {{ clean_varchar('venue_chg_granted') }} as venue_change_granted,
        {{ clean_varchar('hearing_time') }} as hearing_time,

        -- dates: clean dates
        case 
            when osc_date ~ '^\d{4}-\d{2}-\d{2}'
                and left(osc_date, 4)::int > 1900
                then left(osc_date, 10)::date 
        end as osc_date,
        case 
            when input_date ~ '^\d{4}-\d{2}-\d{2}'
                and left(input_date, 4)::int > 1900
                then left(input_date, 10)::date 
        end as input_date,
        case 
            when trans_in_date ~ '^\d{4}-\d{2}-\d{2}'
                and left(trans_in_date, 4)::int > 1900
                then left(trans_in_date, 10)::date
        end as transfer_in_date,
        case 
            when hearing_date ~ '^\d{4}-\d{2}-\d{2}'
                and left(hearing_date, 4)::int > 1900
                then left(hearing_date, 10)::date 
        end as hearing_date,
        case 
            when comp_date ~ '^\d{4}-\d{2}-\d{2}'
                and left(comp_date, 4)::int > 1900
                then left(comp_date, 10)::date 
        end as completion_date,
        case 
            when date_detained ~ '^\d{4}-\d{2}-\d{2}'
                and left(date_detained, 4)::int > 1900
                then left(date_detained, 10)::date 
        end as date_detained,
        case 
            when date_released ~ '^\d{4}-\d{2}-\d{2}'
                and left(date_released, 4)::int > 1900
                then left(date_released, 10)::date
        end as date_released,
        case 
            when date_appeal_due_status ~ '^\d{4}-\d{2}-\d{2}'
                and left(date_appeal_due_status, 4)::int > 1900
                then left(date_appeal_due_status, 10)::date 
        end as appeal_due_date,

        -- date
        case 
            when absentia ~ '^\d{4}-\d{2}-\d{2}'
                and left(absentia, 4)::int > 1900
                then left(absentia, 10)::date 
        end as absentia_date

    from source

)

select * from cleaned