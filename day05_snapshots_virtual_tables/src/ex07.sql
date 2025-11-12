
select * from mv_dmitriy_visits_and_eats;

insert into person_visits (id, person_id, pizzeria_id, visit_date)	
values (
	(select max(id) + 1 from person_visits),
	(select id from person where name = 'Dmitriy'),
	(
		select id from pizzeria 
			where id in (select pizzeria_id from menu where price < 800 order by price) 
			and name != 'Papa Johns'
		limit 1
	),
	date('2022-01-08')
);
-- select * from person_visits

refresh Materialized view mv_dmitriy_visits_and_eats;

select * from mv_dmitriy_visits_and_eats;