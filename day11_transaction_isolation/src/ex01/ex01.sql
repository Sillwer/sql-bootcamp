-- Exercise 01 — Lost Update Anomaly

-- Обе сессии 
SHOW TRANSACTION ISOLATION LEVEL;

-- Сессия #1, 2
begin;

-- Сессия #1,2
select rating from pizzeria where name = 'Pizza Hut';

-- Сессия #1
update pizzeria set rating = 4 where name = 'Pizza Hut';
-- Сессия #2
update pizzeria set rating = 3.6 where name = 'Pizza Hut';

-- Сессия #1,2
commit;

-- Сессия #1,2
select rating from pizzeria where name = 'Pizza Hut';

-- в итоге получаем 3.6, а 4 считается потерянным значением