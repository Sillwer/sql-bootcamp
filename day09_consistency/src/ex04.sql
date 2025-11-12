alter table person_discounts
drop constraint if exists ch_nn_person_id,
drop constraint if exists ch_nn_pizzeria_id,
drop constraint if exists ch_nn_discount,
drop constraint if exists ch_range_discount;

alter table person_discounts
add constraint ch_nn_person_id check(person_id is not null),
add constraint ch_nn_pizzeria_id check(pizzeria_id is not null),
add constraint ch_nn_discount check(discount is not null),
alter column discount set default 0,
add constraint ch_range_discount check(discount >= 0 and discount <= 100); 
