-- Exercise 06 — Function like a function-wrapper

drop function if exists fnc_person_visits_and_eats_on_date;
create or replace function fnc_person_visits_and_eats_on_date(
	pperson varchar default 'Dmitriy',
	pprice numeric default 500,
	pdate date default '2022-01-08'
) returns table (pizzeria_name varchar) as $$
begin
	return query
	select distinct pizz.name
	from person as pers 
		join person_visits visits 
			on pers.name = pperson and visits.person_id = pers.id and visits.visit_date = pdate
		join pizzeria as pizz on pizz.id = visits.id
		join menu as m on m.pizzeria_id = pizz.id and price < pprice;
end;
$$ language plpgsql;

-- select * from fnc_person_visits_and_eats_on_date();
-- select * from fnc_person_visits_and_eats_on_date(pprice := 800);
select * from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');