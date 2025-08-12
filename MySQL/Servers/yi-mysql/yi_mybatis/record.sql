drop table if exists record;
create table record (
		order_id int,
		item_id int,
		name varchar(20),
		price int,
		num int
);


insert into record values (1001, 1, '烤鸡', 30, 3);
insert into record values (1001, 2,  '菠萝', 20, 1);
insert into record values (1002, 2, '烤鸡', 30, 3);
insert into record values (1002, 3, '山寨机', 200, 2);