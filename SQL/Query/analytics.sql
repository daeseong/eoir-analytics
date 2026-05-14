select
    -- null coverage
    count(*) as total_rows,
    count(case
			when osc_date is not null 
			and osc_date   != '' 
			then 1 
		  end) as osc_non_null,
    count(case
			when input_date is not null 
			and input_date != '' 
			then 1 
			end) as input_non_null,

    -- date ranges
    min(case 
			when osc_date ~ '^\d{4}-\d{2}-\d{2}' 
        	and left(osc_date, 4)::int > 1900 
        	then left(osc_date, 10)::date 
		end) as osc_min,
    max(case 
			when osc_date ~ '^\d{4}-\d{2}-\d{2}' 
        	and left(osc_date, 4)::int > 1900 
        	then left(osc_date, 10)::date 
		end) as osc_max,

    min(case 
			when input_date ~ '^\d{4}-\d{2}-\d{2}' 
        	and left(input_date, 4)::int > 1900 
        	then left(input_date, 10)::date 
		end) as input_min,
    max(case 
			when input_date ~ '^\d{4}-\d{2}-\d{2}' 
        	and left(input_date, 4)::int > 1900 
        	then left(input_date, 10)::date 
		end) as input_max

from b_tblproceeding;


select
    case
        when osc_date ~ '^\d{4}-\d{2}-\d{2}' 
		and left(osc_date, 4)::int > 1900
        and input_date ~ '^\d{4}-\d{2}-\d{2}' 
		and left(input_date, 4)::int > 1900
    	then 'both populated'
        when osc_date ~ '^\d{4}-\d{2}-\d{2}' 
		and left(osc_date, 4)::int > 1900
        then 'osc only'
        when input_date ~ '^\d{4}-\d{2}-\d{2}' and left(input_date, 4)::int > 1900
        then 'input only'
        else 'both null'
    end as coverage_bucket,
    count(*) as row_count
from b_tblproceeding
group by 1
order by 2 desc;

select count(*) from eoir_marts.fact_cases where processing_days < 0;

select count(*) from eoir_stg.cases;
select count(*) from eoir_marts.fact_cases;
select count(*) from eoir_marts.fact_cases where latest_proceeding_id is not null;

select distinct strprobono
from tblappeal
limit 20;

select count(*) from eoir_marts.fact_proceedings;
select count(*) from eoir_marts.fact_appeals;

select columns