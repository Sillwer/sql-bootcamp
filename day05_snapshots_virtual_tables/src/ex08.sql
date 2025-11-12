
select * from information_schema.tables where table_type = 'VIEW' and table_name like 'v\_%';

drop view if exists v_generated_dates; 
drop view if exists v_persons_female; 
drop view if exists v_persons_male; 
drop view if exists v_price_with_discount; 
drop view if exists v_symmetric_union; 

select * from information_schema.tables where table_type = 'VIEW' and table_name like 'v\_%';
