drop table if exists nodes;
create table nodes
(
	point1 char(1),
	point2 char(1),
	cost integer,
	primary key (point1, point2)
);

insert into nodes (point1, point2, cost) values
('a', 'b', 10),
('b', 'a', 10),

('a', 'c', 15),
('c', 'a', 15),

('a', 'd', 20),
('d', 'a', 20),

('b', 'c', 35),
('c', 'b', 35),

('b', 'd', 25),
('d', 'b', 25),

('c', 'd', 30),
('d', 'c', 30);

with recursive
-- Количество вершин	
count_of_nodes as (select count (*) from (select distinct point1 from nodes)),
-- Стартовая вершина
start_point as (select 'a' as point),
-- Рекурсивный обход вершин
travel as (
	-- Точка входа в рекурсию (фиксированная часть)
	select
		1 as step,
		point1,
		point2,
		cost,
		(0 + cost) as total_cost,
		'{' || point1 || ',' || point2 || ',' as tour
	from nodes
	where point1 = (select point from start_point)
	
	union
	
	-- Рекурсивная часть - на каждом шагу вычисляется и присоединяется к фиксированной части
	select
		(step + 1) as step,
		now.point1,
		now.point2,
		now.cost,
		(total_cost + now.cost) as total_cost,
		(tour || now.point2 || (CASE WHEN  step < (select * from count_of_nodes) - 1 THEN ',' ELSE '}' END)) as tour
	-- Соединяем (travel) результат прошлой итерации с таблицей node
	from travel prev
	join nodes now
		on now.point1 = prev.point2
		and (
				position(now.point2 in tour) = 0
				or
				(step = (select * from count_of_nodes) - 1 and now.point2 = (select point from start_point))
			)
	-- Точка выхода из рекурсии
	where step < (select * from count_of_nodes)
),
full_path as (
	select * from travel where step = (select * from count_of_nodes)
)

select total_cost, tour 
from full_path
where total_cost = (select min(total_cost) from full_path)
order by total_cost, tour;
