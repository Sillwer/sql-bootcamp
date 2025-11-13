-- Exercise 02 — Audit of incoming deletes

create or replace function fnc_trg_person_delete_audit() returns trigger as $$
begin
	insert into person_audit(type_event, row_id, name, age, gender, address)
	values ('D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
	return OLD;
end;
$$ language plpgsql;

create or replace trigger trg_person_delete_audit
after DELETE on "person"
for each row
execute procedure fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;

select * from person_audit;
-- select * from person;