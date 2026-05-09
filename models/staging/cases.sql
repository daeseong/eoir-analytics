with

source as (

    select * from {{ source('eoir_raw', 'a_tblcase') }}

),

cleaned as (

    select
        idncase,

        -- location
        {{ clean_varchar('alien_city') }} as alien_city,
        {{ clean_varchar('alien_state') }} as alien_state,
        {{ clean_varchar('alien_zipcode') }} as alien_zipcode,
        {{ clean_varchar('updated_city') }} as updated_city,
        {{ clean_varchar('updated_state') }} as updated_state,
        {{ clean_varchar('updated_zipcode') }} as updated_zipcode,
        {{ clean_varchar('update_site') }} as update_site_code,

        -- lookup codes
        {{ clean_varchar('nat') }} as nationality_code,
        {{ clean_varchar('lang') }} as language_code,
        {{ clean_varchar('sex') }} as sex,
        {{ clean_varchar('custody') }} as custody_code,
        {{ clean_varchar('site_type') }} as site_type_code,
        {{ clean_varchar('case_type') }} as case_type_code,
        {{ clean_varchar('atty_nbr') }} as attorney_number,
        {{ clean_varchar('c_asy_type') }} as asylum_type_code,
        {{ clean_varchar('casepriority_code') }} as case_priority_code,
        {{ clean_varchar('up_bond_rsn') }} as bond_reason_code,

        -- dates: a_tblcase uses clean YYYY-MM-DD, safe to cast directly
        case 
            when e_28_date ~ '^\d{4}-\d{2}-\d{2}'
            then left(e_28_date, 10)::date 
        end as e28_date,
        case 
            when latest_hearing ~ '^\d{4}-\d{2}-\d{2}'
            then left(latest_hearing, 10)::date 
        end as latest_hearing_date,
        case 
            when up_bond_date ~ '^\d{4}-\d{2}-\d{2}'
            then left(up_bond_date, 10)::date 
        end as bond_date,
        case 
            when date_of_entry ~ '^\d{4}-\d{2}-\d{2}'
            then left(date_of_entry, 10)::date 
        end as date_of_entry,
        case 
            when c_birthdate ~ '^\d{4}-\d{2}-\d{2}'
            then left(c_birthdate, 10)::date 
        end as birthdate,
        case 
            when c_release_date ~ '^\d{4}-\d{2}-\d{2}'
            then left(c_release_date, 10)::date 
        end as release_date,
        case 
            when address_changedon ~ '^\d{4}-\d{2}-\d{2}'
            then left(address_changedon, 10)::date 
        end as address_changed_date,
        case 
            when date_detained ~ '^\d{4}-\d{2}-\d{2}'
            then left(date_detained, 10)::date 
        end as date_detained,
        case 
            when date_released ~ '^\d{4}-\d{2}-\d{2}'
            then left(date_released, 10)::date 
        end as date_released,
        case 
            when detention_date ~ '^\d{4}-\d{2}-\d{2}'
            then left(detention_date, 10)::date 
        end as detention_date,

        -- release period
        case 
            when release_month ~ '^\d+$'
            then release_month::integer 
        end as release_month,
        case 
            when release_year ~ '^\d+$'
            then release_year::integer 
        end as release_year,

        -- detention details
        {{ clean_varchar('detention_location') }} as detention_location,
        {{ clean_varchar('dco_location') }} as dco_location,
        {{ clean_varchar('detention_facility_type') }} as detention_facility_type,
        {{ clean_varchar('correctional_fac') }} as correctional_facility,
        {{ clean_varchar('inmate_housing') }} as inmate_housing,

        -- messy / deferred fields (keep raw, revisit in marts)
        {{ clean_varchar('lpr') }} as lpr_raw,
        {{ clean_varchar('zbond_mrg_flag') }} as zbond_mrg_flag_raw,
        {{ clean_varchar('latest_time') }} as latest_hearing_time,
        {{ clean_varchar('latest_cal_type') }} as latest_cal_type_code

    from source

)

select * from cleaned