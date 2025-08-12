drop table if exists item;
create table item (
		id int,
		name varchar(20),
		price int
);

insert into item values (1, '菠萝', 20);
insert into item values (2, '山寨机', 200);
insert into item values (3, '烤鸡', 30);
insert into item values (4, '烤鸭', 25);