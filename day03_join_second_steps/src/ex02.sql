select
	COALESCE(person.name, '-') as person_name,
	visit_date,
	COALESCE(pizzeria.name, '-') as pizzeria_name
from
	(select * from person_visits where visit_date between '2022-01-01' and '2022-01-03') pv
	full join pizzeria
		on pv.pizzeria_id = pizzeria.id
	full join person
		on pv.person_id = person.id

order by person_name, visit_date, pizzeria_name