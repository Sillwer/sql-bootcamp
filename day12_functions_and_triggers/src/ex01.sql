-- Exercise 01 — Audit of incoming updates

create or replace function fnc_trg_person_update_audit() returns trigger as $$
begin
	insert into person_audit(type_event, row_id, name, age, gender, address)
	values ('U', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
	return NEW;
end;
$$ language plpgsql;

create or replace trigger trg_person_update_audit 
after update on "person"
for each row
execute procedure fnc_trg_person_update_audit();

UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;

select * from person_audit;
-- select * from person;