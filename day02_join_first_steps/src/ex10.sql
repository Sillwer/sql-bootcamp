select
	person_name, pizza_name, pizzeria_name
from
	(select person_id, menu_id from person_order)
	natural join
	(select id as person_id, name as person_name from person)
		natural join
		(select id as menu_id, pizza_name, pizzeria_id from menu)
			natural join
			(select id as pizzeria_id, name as pizzeria_name from pizzeria)

order by person_name, pizza_name, pizzeria_name