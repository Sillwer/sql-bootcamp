select p.name as name,
	count(*) as count_of_orders,
	round(avg(m.price), 2) as average_price,
	max(m.price) as max_price,
	min(m.price) as min_price
from menu as m 
	join pizzeria as p on m.pizzeria_id = p.id
	join person_order as ord on ord.menu_id = m.id
group by p.id, p.name
order by name;
