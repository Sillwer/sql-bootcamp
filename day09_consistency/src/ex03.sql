drop index if exists idx_person_discounts_unique;
create unique index idx_person_discounts_unique on person_discounts (person_id, pizzeria_id) include (discount);

set enable_seqscan = off;
explain analyze
select name, discount 
from person
    join person_discounts on person.id = person_discounts.person_id

-- set enable_seqscan = on;
