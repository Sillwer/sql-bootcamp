with orders_in_persons_city as (
	select
		pizzeria_id,
		person_id
	from person_order as orders
		join menu on
			orders.menu_id = menu.id 
			and
			exists(select * from person_visits where person_id = orders.person_id and pizzeria_id = menu.pizzeria_id)
)

select address, pizzeria.name, count(*) as count_of_orders
from orders_in_persons_city oips
	join person		on oips.person_id = person.id
	join pizzeria 	on oips.pizzeria_id = pizzeria.id
group by address, pizzeria.id, pizzeria.name
order by address, pizzeria.name