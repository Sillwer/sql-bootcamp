COMMENT ON TABLE person_discounts IS 'Таблица хранит информацию о скидках для клиентов в разных пиццериях.';

COMMENT ON COLUMN person_discounts.id IS 'Уникальный идентификатор записи о скидке';
COMMENT ON COLUMN person_discounts.person_id IS 'Идентификатор клиента. Ссылка на таблицу person';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Идентификатор пиццерии, в которой предоставляется скидка. Ссылка на таблицу pizzeria';
COMMENT ON COLUMN person_discounts.discount IS 'Размер скидки в процентах (0 до 100)';
