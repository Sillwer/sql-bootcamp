-- menu
drop index if exists  idx_menu_pizzeria_id;
create index idx_menu_pizzeria_id on menu (pizzeria_id);

-- person_visits
drop index if exists idx_person_visits_person_id, idx_person_visits_pizzeria_id;
create index idx_person_visits_person_id   on person_visits (person_id);
create index idx_person_visits_pizzeria_id on person_visits (pizzeria_id);

-- person_order
drop index if exists idx_person_order_person_id, idx_person_order_menu_id;
create index idx_person_order_person_id on person_order (person_id);
create index idx_person_order_menu_id   on person_order (menu_id);