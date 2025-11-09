insert into menu (id, pizzeria_id, pizza_name, price)
values (19, 2, 'greek pizza', 800)
on conflict (id) do nothing;

select * from menu;

-- delete from menu where id = 19