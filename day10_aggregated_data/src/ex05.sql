select distinct p.name
from person_order as ord
    join person p on ord.person_id = p.id
order by name;