-- Exercise 00 — Audit of incoming inserts

drop table if exists person_audit;
create table person_audit (
    created timestamp with time zone default CURRENT_TIMESTAMP not null,
    type_event char(1) default 'I'::char(1) not null,
    row_id bigint not null,  -- id bigint not null
    name varchar,    -- name character varying not null
    age integer,     -- age integer default 10 not null
    gender varchar,  -- gender character varying default 'female'::character varying not null
    address varchar, -- address character varying
    constraint ch_val_type_event check (type_event in ('I', 'D', 'U'))
);

comment on column person_audit.created is 'timestamp when a new event has been created.  Default value is a current timestamp and NOT NULL';
comment on column person_audit.type_event is 'possible values I (insert), D (delete), U (update). Default value is ‘I’. NOT NULL.';
comment on column person_audit.row_id  is 'copy of person.id. NOT NULL';
comment on column person_audit.name    is 'copy of person.name (no any constraints)';
comment on column person_audit.age     is 'copy of person.age (no any constraints)';
comment on column person_audit.gender  is 'copy of person.gender (no any constraints)';
comment on column person_audit.address is 'copy of person.address (no any constraints)';

create or replace function fnc_trg_person_insert_audit() returns trigger as $$
begin
	insert into person_audit(type_event, row_id, name, age, gender, address)
	values ('I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
	return NEW;
end;
$$ language plpgsql;

create or replace trigger trg_person_insert_audit
after insert on "person"
for each row
execute procedure fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');

select * from person_audit;
-- select * from person; 
-- delete from person where id = 10;