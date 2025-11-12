-- Отключить попытки последовательного поиска (всегда использовать индексы)
set enable_seqscan = off;

EXPLAIN ANALYZE
	
select m.pizza_name, p.name as pizzeria_name
	from menu m join pizzeria p on m.pizzeria_id = p.id 

-- Вернуть обратно
-- set enable_seqscan = on;