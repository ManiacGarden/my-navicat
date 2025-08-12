drop table if exists orders;
create table orders (
		id int,
		username varchar(20)
);

insert into orders values (1001, '李大猫');
insert into orders values (1002, '李中猫');

select
		o.id as oid, o.username as oname, r.item_id as rid, r.num as rnum, r.price as rprice
from
		orders as o
		left join
		record as r
		on o.id = r.order_id
		left join
		item as i
		on r.item_id = i.id
where
		o.id = 1002;