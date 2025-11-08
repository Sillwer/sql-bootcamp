-- найдите название пиццерии, которую Дмитрий посетил 8 января 2022 года и где можно было отведать пиццу менее чем за 800 рублей.

with D_visits as ( -- Пиццерии, посещенные Дмитрием
	select * from person_visits 
	where person_id = (select id from person where name = 'Dmitriy' order by id limit 1)
		and visit_date = '2022-01-08'
),
pizzeria_id_less_800 as ( -- Пиццерии с пиццей по цене < 800
	select pizzeria_id from menu where price < 800
)

select pizzeria.name as pizzeria_name
	from D_visits
		join pizzeria_id_less_800 using (pizzeria_id)
		join pizzeria on pizzeria_id = pizzeria.id