-- Exercise 07 — Different view to find a Minimum

drop function if exists func_minimum;
create function func_minimum(arr numeric[]) returns numeric as
$$
declare
	minimum numeric := arr[1];
	n numeric;
begin
	foreach n in array arr
	loop
		if (n < minimum) then minimum := n;
		end if;
	end loop;
	return minimum;
end;
$$ language plpgsql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);
-- select * from func_minimum('{1000, -2}');
-- select * from func_minimum('{1000, 1}');

