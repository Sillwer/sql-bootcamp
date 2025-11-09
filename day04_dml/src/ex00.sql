with visited_pizzeria as (
	select pizzeria_id, visit_date from person_visits 
	where person_id in (select id from person where name = 'Kate')
)

select 
	pizza_name,
	price, 
	(select name from pizzeria where id = pizzeria_id) as pizzeria_name, 
	visit_date
from menu join visited_pizzeria using(pizzeria_id)
where price between 800 and 1000
order by pizza_name, price, pizzeria_name;