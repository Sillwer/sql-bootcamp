-- Exercise 05 — Phantom Reads Anomaly

-- Сессия #1, 2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Сессия #1
select sum(rating) from pizzeria;

-- Сессия #2
insert into pizzeria values (10, 'Kazan Pizza', 5);
commit;

-- Сессия #1
select sum(rating) from pizzeria;
commit;
select sum(rating) from pizzeria;

-- Сессия #2
select sum(rating) from pizzeria;