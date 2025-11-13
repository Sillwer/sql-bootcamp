-- Exercise 03 — Generic Audit

drop trigger if exists trg_person_insert_audit on person;
drop trigger if exists trg_person_update_audit on person;
drop trigger if exists trg_person_delete_audit on person;
drop function if exists fnc_trg_person_insert_audit;
drop function if exists fnc_trg_person_update_audit;
drop function if exists fnc_trg_person_delete_audit;
truncate table person_audit;


create or replace function fnc_trg_person_audit() returns trigger as $$
begin
	if (TG_OP = 'INSERT') then 
		insert into person_audit(type_event, row_id, name, age, gender, address)
		values ('I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
		return NEW;
	elseif (TG_OP = 'UPDATE') then
		insert into person_audit(type_event, row_id, name, age, gender, address)
		values ('U', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
		return NEW;
	elseif (TG_OP = 'DELETE') then
		insert into person_audit(type_event, row_id, name, age, gender, address)
		values ('D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
		return OLD;
	end if;
end;
$$ language plpgsql;

create or replace trigger trg_person_audit
after INSERT or UPDATE or DELETE on "person"
for each row
execute procedure fnc_trg_person_audit();


INSERT INTO person(id, name, age, gender, address)  VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;

select * from person_audit;
-- select * from person;
-- drop trigger trg_person_audit on person; drop function fnc_trg_person_audit;