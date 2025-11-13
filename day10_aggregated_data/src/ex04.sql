select p.name, count(*) as count_of_visits
from person_visits v
    join person p on v.person_id = p.id
group by p.id, p.name
having count(*) > 3
order by count_of_visits desc, p.name asc;