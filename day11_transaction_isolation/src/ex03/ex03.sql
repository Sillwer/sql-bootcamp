-- Exercise 03 — Non-Repeatable Reads Anomaly

-- вернем исходное значение
update pizzeria set rating = 5 where name = 'Pizza Hut';

-- Сессия #1, 2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Сессия #1
select rating from pizzeria where name = 'Pizza Hut';

-- Сессия #2
update pizzeria set rating = 3.6 where name = 'Pizza Hut';	
commit;

-- Сессия #1 -- изменения чужой транзакции будут отражаться прямо в текущей транзакции
select rating from pizzeria where name = 'Pizza Hut';
commit;
select rating from pizzeria where name = 'Pizza Hut';

-- Сессия #2
select rating from pizzeria where name = 'Pizza Hut';