-- Exercise 08 — Fibonacci algorithm is in a function

drop function if exists fnc_fibonacci;
create function fnc_fibonacci(pstop integer default 10) returns table(n integer) as 
$$
declare
    n1 integer := 0;
    n2 integer := 1;
begin
	n := n1;
	if n < pstop then return NEXT; end if;

	n := n2;
	if n < pstop then return NEXT; end if;

	loop
		n := n1 + n2;
		n1 := n2;
		n2 := n;
		if n < pstop
			then return NEXT;
		else
			exit;
		end if;
	end loop;

    return;
end
$$ language plpgsql;

select * from fnc_fibonacci(100);
-- select * from fnc_fibonacci();
