(select id, 
	name as object_name
	from person
	order by object_name)
	
union all
	
(select id, 
	pizza_name as object_name
	from menu
	order by object_name)

order by id, object_name