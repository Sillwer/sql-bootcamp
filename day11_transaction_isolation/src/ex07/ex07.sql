-- Exercise 07 — Deadlock

-- Сессия #1, 2
begin;

-- Сессия #1
update pizzeria set rating = 4 where id = 1;
-- Сессия #2
update pizzeria set rating = 4 where id = 2;

-- Сессия #1
update pizzeria set rating = 4 where id = 2; -- выполнение приостановилось
-- Сессия #2
update pizzeria set rating = 4 where id = 1; -- ошибка взимной блокрировки

-- Сессия #1, 2
commit;