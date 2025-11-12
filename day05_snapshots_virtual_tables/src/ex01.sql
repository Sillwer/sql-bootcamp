select name from v_persons_female
union
select name from v_persons_male
order by name;

-- select * from information_schema.tables where table_type = 'VIEW'