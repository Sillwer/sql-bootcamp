drop index if exists idx_person_order_order_date;
create unique index on person_order (person_id, menu_id)
where order_date = date '2022-01-01';

set enable_seqscan = off;
explain analyze
select person_id, menu_id
from person_order
where order_date = date '2022-01-01';
