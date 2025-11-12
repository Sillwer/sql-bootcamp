drop view if exists v_generated_dates;
create view v_generated_dates as
select date(generate_series(date('2022-01-01'), date('2022-01-31'), '1 day')) as generated_date
order by generated_date;

select * from v_generated_dates;