with not_ordered_menu as ( 
	select * from menu
	where id not in (select menu_id from person_order)
)

select nom.pizza_name, nom.price, p.name as pizzeria_name
from not_ordered_menu as nom 
	join pizzeria as p on nom.pizzeria_id = p.id
order by pizza_name, price;