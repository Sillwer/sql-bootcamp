-- Exercise 04 — Non-Repeatable Reads for Serialization

-- вернем исходное значение
update pizzeria set rating = 5 where name = 'Pizza Hut';

-- Сессия #1, 2
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Сессия #1
select rating from pizzeria where name = 'Pizza Hut';

-- Сессия #2
update pizzeria set rating = 3 where name = 'Pizza Hut';
commit;

-- Сессия #1 -- изменения другой транзакции не видны в рамках текущей
select rating from pizzeria where name = 'Pizza Hut';
commit;
select rating from pizzeria where name = 'Pizza Hut';

-- Сессия #2
select rating from pizzeria where name = 'Pizza Hut';