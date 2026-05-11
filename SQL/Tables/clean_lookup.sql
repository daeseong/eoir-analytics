select * from tblookupcourtdecision limit 5;
select * from tblappeal limit 2;

select column_name 
from information_schema.columns 
where table_name = 'tbllookupappealtype'
order by ordinal_position;