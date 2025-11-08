with DA_orders as ( -- Только нужные заказы
	select menu_id
	from person_order
	where person_id in (select id from person where name in ('Denis', 'Anna'))
), 
DA_menu_ordered as ( -- Меню этих заказов
	select pizzeria_id, pizza_name
	from menu where id in (Select menu_id from DA_orders)
)
	
select
	pizza_name,
	pizzeria.name as pizzeria_name
from DA_menu_ordered
	join pizzeria on pizzeria_id = pizzeria.id

order by pizza_name, pizzeria_name