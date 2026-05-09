with

judges as (

    select * from {{ ref('judge_code') }}

),

final as (

    select
        judge_code,
        judge_name,
        city,
        state,
        is_active

    from judges

)

select * from final