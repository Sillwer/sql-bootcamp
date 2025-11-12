select 
    gd.generated_date as missing_date 
from v_generated_dates as gd
    left join person_visits as pv on pv.visit_date = gd.generated_date
where pv.visit_date is null
order by missing_date;
