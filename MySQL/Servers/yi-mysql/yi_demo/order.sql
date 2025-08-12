drop table if EXISTS orders;
create table orders (
		id int,
		ordername varchar(20)
);

insert into orders values (1, "爱疯");
insert into orders values (2, "猴米");
insert into orders values (3, "爱国为");
select id from orders where ordersname = "猴米";