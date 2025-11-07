select 
	person.id as "person.id", person.name, person.age, gender, address,
	pizzeria.id as "pizzeria.id", pizzeria.name, rating
from
	person join pizzeria on true
order by
	person.id, pizzeria.id