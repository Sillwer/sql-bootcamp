select missing_date
	
from
	(select generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval)::date as missing_date) 
	left join
	(select * from person_visits where person_id = 1 or person_id = 2) t2 -- where person_id != 1 and person_id != 2  
	on visit_date = missing_date

where visit_date is null

order by missing_date