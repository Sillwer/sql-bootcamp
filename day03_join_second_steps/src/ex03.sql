with date_range as (
	select generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval)::date as missing_date
),
visit_range as (
	select * from person_visits where person_id = 1 or person_id = 2
)
	
select missing_date
from date_range
	left join visit_range on missing_date = visit_date
where
	visit_date is null
order by
	missing_date