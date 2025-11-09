with
base_id    as (select coalesce(max(id), 1) as id from person_order),
person_id  as (select generate_series(1, (select count(*) from person)) as id),
greek_menu as (select id from menu where pizza_name = 'greek pizza')

insert into person_order (id, person_id, menu_id, order_date)
select 
	(base_id.id + person_id.id),
	person_id.id,
	greek_menu.id,
	date '2022-02-25'
from person_id, base_id, greek_menu;

select * from person_order;

-- delete from person_order where id > 22; select * from person_order; select * from person