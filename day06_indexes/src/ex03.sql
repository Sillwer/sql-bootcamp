drop index if exists idx_person_order_multi;
create index idx_person_order_multi on person_order (person_id, menu_id) include (order_date);

set enable_seqscan = off;
EXPLAIN ANALYZE
SELECT person_id, menu_id, order_date
FROM person_order
WHERE person_id = 8 AND menu_id = 19

-- set enable_seqscan = on;