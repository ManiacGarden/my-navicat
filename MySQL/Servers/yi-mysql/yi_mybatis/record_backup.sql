drop table if exists record;
create table record (
		order_id int,
		item_id int,
		num int
);

insert into record values (1001, 1, 3);
insert into record values (1001, 2, 1);
insert into record values (1002, 2, 3);
insert into record values (1002, 3, 2);