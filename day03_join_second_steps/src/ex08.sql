with MS_man as ( -- Москвичи да самарцы
	select name as person_name, id as person_id  from person
	where gender = 'male'
		and (address = 'Moscow' or address = 'Samara')
),
MP_pizza as ( -- Любителя грибов да пеппе
	select id as menu_id from menu
	where pizza_name like '%mushroom%'
	   or pizza_name like '%pepperoni%'
)

select person_name as name
from person_order
	join MP_pizza using (menu_id)
	join MS_man 	using (person_id)

order by name desc