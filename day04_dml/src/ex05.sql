with visited as (
	select 
		pizzeria_id
	from person_visits as pv
		join person on person.name = 'Andrey' and pv.person_id = person.id
),
ordered as (
	select
		menu.pizzeria_id
	from person_order as po
		join person on person.name = 'Andrey' and person.id = po.person_id
		join menu   on menu.id = po.menu_id
),

visited_not_ordered as (
	select pizzeria_id from visited
	except
	select pizzeria_id from ordered)

select pizzeria.name as pizzeria_name
from visited_not_ordered as vno
	join pizzeria on pizzeria.id = vno.pizzeria_id
order by pizzeria_name;