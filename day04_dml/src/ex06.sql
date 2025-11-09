with pizza as (
	select
		menu.id as menu_id,
		pizza_name,
		pizzeria.name as pizzeria_name,
		price
	from menu
		join pizzeria on menu.pizzeria_id = pizzeria.id
)

select 
	p1.pizza_name    as pizza_name,
	p1.pizzeria_name as pizzeria_name_1,
	p2.pizzeria_name as pizzeria_name_2,
	p1.price         as price
from pizza as p1 join pizza as p2
	on  p1.menu_id       > p2.menu_id
	and p1.pizzeria_name != p2.pizzeria_name
	and p1.pizza_name     = p2.pizza_name
	and p1.price          = p2.price
order by pizza_name;
