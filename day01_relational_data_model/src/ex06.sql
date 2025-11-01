select
	(select name from person where person.id = person_order.person_id) as name,
	(select COALESCE(name = 'Denis', true, false) from person where person.id = person_order.person_id) as check_name
from person_order
where order_date = '2022-01-07'
  and (menu_id = 13 OR menu_id = 14 OR menu_id = 18)