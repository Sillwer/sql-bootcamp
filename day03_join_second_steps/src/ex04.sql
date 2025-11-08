with pizza as (
	select 	pizzeria_id, pizza_name, price
	from 		menu
	where 	pizza_name like '%mushroom%' or pizza_name like '%pepperoni%'
)

select
	pizza_name,
	pizzeria.name as pizzeria_name,
	price
from
	pizza join pizzeria
		on pizzeria_id = pizzeria.id
order by
	pizza_name, pizzeria_name