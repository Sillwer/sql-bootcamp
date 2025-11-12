drop view if exists v_persons_female;
create view v_persons_female as
select * from person where gender = 'female';

drop view if exists v_persons_male;
create view v_persons_male as
select * from person where gender = 'male';

select * from v_persons_female;
-- select * from v_persons_male;
