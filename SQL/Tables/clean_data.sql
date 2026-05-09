-- checking for duplicates
select
	count(*) as total_rows,
	count(distinct idncase) as unique_caseid,
	count(*) - count(distinct idncase) as duplicate_id
from a_tblcase;

-- check for missing data on relevent columns
select
    count(idncase) as idncase,
    count(nat) as nationality,
    count(lang) as language,
    count(sex) as sex,
    count(case_type) as case_type,
    count(custody) as custody,
    count(date_of_entry) as date_of_entry,
    count(c_birthdate) as birthdate,
    count(atty_nbr) as attorney_number,
    count(casepriority_code) as case_priority
from a_tblcase;

-- all columns some missing data, check if empty strings or nulls
select
    count(*) filter (where nat is null)				as nat_null,
    count(*) filter (where trim(nat) = '')			as nat_blank,
    count(*) filter (where lang is null)       		as lang_null,
    count(*) filter (where trim(lang) = '')			as lang_blank,
    count(*) filter (where case_type is null)		as case_null,
    count(*) filter (where trim(case_type) = '')	as case_blank
from a_tblcase;

-- EDA --
select 
	sex as val, 
	count(*) as cnt
from a_tblcase
group by 1

--------------------------------

select 
	left(date_of_entry, 10) as sample_dates,
	count(*) as cnt
from a_tblcase 
where date_of_entry is not null 
	and trim(date_of_entry) != ''
	and left(date_of_entry, 10) !~ '^\d{4}-\d{2}-\d{2}'
group by 1
order by cnt
limit 5

-- 

select 
	c_birthdate as sample_dates,
	count(*) as cnt
from a_tblcase 
where c_birthdate is not null 
	and trim(c_birthdate) != ''
group by 1
order by 2
limit 5

-- 

select 
	left(latest_hearing, 10), 
	count(*) as cnt
from a_tblcase 
where latest_hearing is not null
	and trim(latest_hearing) != ''
	and left(latest_hearing, 10) !~ '^\d{4}-\d{2}-\d{2}'
group by 1

--- 

select 
	left(date_detained, 10), 
	count(*)
from a_tblcase 
where date_detained is not null 
	and trim(date_detained) != ''
	and left(date_detained, 10) !~ '^\d{4}-\d{2}-\d{2}'
group by 1
order by 2

--- check other columns for proper staging

select nat
from a_tblcase
where length(nat) != 2
limit 5;

select
	casepriority_code,
	count(*)
from a_tblcase
group by 1
order by 2 desc
limit 50;

---- 

select 
	strattylevel,
	count(*) as cnt
from tbl_repsassigned
group by 1
order by 2
limit 5

