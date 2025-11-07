select action_date, name as person_name from
	(
		select order_date as action_date, person_id from person_order
		intersect
		select visit_date, person_id from person_visits
	) as t1
		join person on t1.person_id = person.id
	
order by action_date asc, person_name desc