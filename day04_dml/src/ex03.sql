with visits as (
	select
		pizzeria.name as pizzeria_name,
		person.gender as gender
	from person_visits
		join person   on person.id   = person_visits.person_id 
		join pizzeria on pizzeria.id = person_visits.pizzeria_id
),
men_minus_women as (
	select pizzeria_name from visits where gender = 'male'
	except all
	select pizzeria_name from visits where gender = 'female'
),
women_minus_men as (
	select pizzeria_name from visits where gender = 'female'
	except all
	select pizzeria_name from visits where gender = 'male'
)

select * from men_minus_women
union all
select * from women_minus_men
order by pizzeria_name;