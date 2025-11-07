select * from pizzeria
where id not in (select pizzeria_id from person_visits);

select * from pizzeria
where not exists (select * from person_visits where pizzeria_id = pizzeria.id);