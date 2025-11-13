-- Exercise 05 — Parameterized Database Function

drop function if exists fnc_persons_female;
drop function if exists fnc_persons_male;

create or replace function fnc_persons(pgender varchar default 'male') 
returns table(
		id bigint,
		name varchar,
		age integer,
		gender varchar,
		address varchar
	) as
$$
	select * from person where gender = pgender;
$$ language sql;

select * from fnc_persons()
-- select * from fnc_persons('female')