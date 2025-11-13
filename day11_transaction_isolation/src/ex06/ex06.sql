-- Exercise 06 — Phantom Reads for Repeatable Read

-- Сессия #1, 2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Сессия #1
select sum(rating) from pizzeria;

-- Сессия #2
insert into pizzeria values (11, 'Kazan Pizza 2', 4);
commit;

-- Сессия #1
select sum(rating) from pizzeria; -- старое значение
commit;
select sum(rating) from pizzeria; -- новое значение

-- Сессия #2
select sum(rating) from pizzeria;