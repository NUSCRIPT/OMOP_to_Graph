
--1.get all start and end dates and merge them grouping by pts



SELECT  person_id,
                visit_start_date as visit_dates
into v1
FROM "visit_occurrence" where visit_source_value = 'Inpatient';

select count(*) from v1 limit 100; --379221

SELECT person_id,
                visit_end_date as visit_dates
into v2
FROM "visit_occurrence" where visit_source_value = 'Inpatient';

select count(*) from v2  --379221


select * into visits
from
((select * from v1) 
union all
(select * from v2)) v;

select count(*) from visits-- limit 100; --758442

-- select distinct person_id, count(*)
-- from visits
-- group by person_id
-- order by count(*) desc -- min 2 max 888 inpatient visits

--2. check duplicate 

select  person_id, visit_dates,count(*) as ct
from visits
group by person_id,visit_dates
having count(*) >1
order by ct desc -- 108713


drop table  v1
drop table  v2
drop table visits
