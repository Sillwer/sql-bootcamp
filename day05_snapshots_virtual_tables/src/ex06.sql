drop materialized view if exists mv_dmitriy_visits_and_eats;
create materialized view mv_dmitriy_visits_and_eats as
with visited as (
	select pizzeria_id
	from person_visits
	where
		person_id = (select id from person where person.name = 'Dmitriy')
		and
		visit_date = '2022-01-08'
),
with_good_price as (
	select pizzeria_id from menu where price < 800
)
select pizzeria.name
from (
	select pizzeria_id from visited
	intersect
	select pizzeria_id from with_good_price
) as convenient_piz
	join pizzeria on convenient_piz.pizzeria_id = pizzeria.id;

select * from mv_dmitriy_visits_and_eats;
