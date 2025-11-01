select (select name from person where person.id = person_order.person_id) as pers_info
from person_order
where order_date = '2022-01-07'
  and (menu_id = 13 or menu_id = 14 ormenu_id = 18)
order by pers_info asc