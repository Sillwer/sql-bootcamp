drop index if exists idx_person_name;
create index on person (upper(name));

set enable_seqscan = off;
EXPLAIN ANALYZE
select * from person where upper(name) = 'ANNA';

-- set enable_seqscan = on;