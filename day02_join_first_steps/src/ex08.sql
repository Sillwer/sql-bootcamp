select order_date, person_information

from
	(select id as person_id,
			concat(name, ' (age:', age, ')') as person_information
	from person) 
	
	NATURAL join person_order

order by order_date, person_information;
