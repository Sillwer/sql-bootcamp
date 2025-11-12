drop view if exists v_price_with_discount;
create view v_price_with_discount as 
select 
	person.name		as name,
	menu.pizza_name	as pizza_name,
	menu.price		as price,
	(menu.price - menu.price * 0.1)::integer as discount_price
from person_order as ord
	join person on person.id = ord.person_id
	join menu   on menu.id   = ord.menu_id
order by name, pizza_name;

select * from v_price_with_discount;