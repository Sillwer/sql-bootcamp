with orders as (
	select distinct
		pizzeria.name as pizzeria_name,
		person.gender as gender
	from person_order
	join person   on person.id   = person_order.person_id
	join menu     on menu.id     = person_order.menu_id
	join pizzeria on pizzeria.id = menu.pizzeria_id
),
both_male_female as (
	select pizzeria_name from orders where gender = 'male'
	intersect
	select pizzeria_name from orders where gender = 'female'
),
only_male as (
	select pizzeria_name from orders where gender = 'male'
	except
	select pizzeria_name from both_male_female
),
only_female as (
	select pizzeria_name from orders where gender = 'female'
	except
	select pizzeria_name from both_male_female
)

select * from only_male
union
select * from only_female

order by pizzeria_name;