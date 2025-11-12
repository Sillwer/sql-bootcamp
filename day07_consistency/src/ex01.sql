truncate table person_discounts;

insert into person_discounts (id, person_id, pizzeria_id, discount)
select
	row_number() over(order by ord.person_id),
	ord.person_id,
	m.pizzeria_id,
	case 
		when count(*) = 1 then 10.5
		when count(*) = 2 then 22
		else 30
	end
from person_order ord
	join menu as m on m.id = ord.menu_id
group by ord.person_id, m.pizzeria_id;

select * from person_discounts;
