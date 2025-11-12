select
	person.name as name,
	menu.pizza_name as pizza_name,
	menu.price as price,
	ROUND((price - (price * discount / 100))) as discount_price
	
from person_order as pers_ord
	join menu 		on menu.id = pers_ord.menu_id
	join pizzeria 	on pizzeria.id = menu.pizzeria_id
	join person 	on person.id = pers_ord.person_id
	join person_discounts as pers_disc on pers_disc.person_id = person.id

order by name, pizza_name;
