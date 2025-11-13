-- Exercise 00 — Simple transaction

-- Сеессия #1
begin;
update pizzeria set rating = 5 where name = 'Pizza Hut';

-- Сессия #2
select * from pizzeria where name = 'Pizza Hut'; -- 4.6

-- Сеессия #1
commit;

-- Сессия #2
select * from pizzeria where name = 'Pizza Hut'; -- 5