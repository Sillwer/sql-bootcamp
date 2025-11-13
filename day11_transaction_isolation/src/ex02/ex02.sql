-- Exercise 02 — Lost Update for Repeatable Read

-- вернем исходное значение
update pizzeria set rating = 5 where name = 'Pizza Hut';

-- Сессия #1, 2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Сессия #1, 2
select rating from pizzeria where name = 'Pizza Hut';

-- Сессия #1 -- UPDATE 1
update pizzeria set rating = 4 where name = 'Pizza Hut';
-- Сессия #2 -- ОШИБКА:  не удалось сериализовать доступ из-за параллельного изменения
update pizzeria set rating = 4 where name = 'Pizza Hut';

-- Сессия #1
commit; -- COMMIT
-- Сессия #2
commit; -- ROLLBACK

-- Сессия #1, 2
select rating from pizzeria where name = 'Pizza Hut'; -- 4

--  в этом режиме не получается внести имзенения в троку, в которой сейчас проиходят изменения