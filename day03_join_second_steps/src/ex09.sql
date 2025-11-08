with women_orders as ( -- все женские заказы
	select menu_id, person_name, person_id
	from (select name as person_name, id as person_id
				from person where gender = 'female') as women
		join person_order using (person_id)
),
P_menu as ( -- всё меню с пепперони
	select id as menu_id, pizza_name from menu
	where pizza_name like '%pepperoni%'
),
C_menu as ( -- всё меню с сыром
	select id as menu_id, pizza_name from menu
	where pizza_name like '%cheese%'
)
	
select person_name as name
from
(
	select person_id, person_name from women_orders join P_menu using (menu_id)
	intersect
	select person_id, person_name from women_orders join C_menu using (menu_id)
)
order by name
