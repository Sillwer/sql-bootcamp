with visits as (
	select p.name, count(*) count, 'visit' as action_type
	from person_visits as vis
		join pizzeria as p on vis.pizzeria_id = p.id 
	group by p.id, p.name
	order by count desc
	limit 3
), 
orders as (
	select p.name, count(*) count, 'order' as action_type
	from person_order as ord
		join menu m on ord.menu_id = m.id
		join pizzeria as p on m.pizzeria_id = p.id
	group by p.id, p.name
	order by count desc
	limit 3
)

select * from orders
union
select * from visits
order by action_type asc, count desc;
