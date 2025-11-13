with t as (
	select address,
	round(max(age) - (min(age)::numeric / max(age)), 2) as formula,
	round(avg(age), 2) as average
	from person
	group by address
	order by address
)

select
	address,
	formula,
	average,
	(formula > average) as comparison
from t;
