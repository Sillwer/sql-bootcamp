select pizzeria.name, pizzeria.rating
from pizzeria left join person_visits
						on pizzeria.id = pizzeria_id
where visit_date is null