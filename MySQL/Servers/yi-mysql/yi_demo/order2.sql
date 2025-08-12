drop table if EXISTS order2;
create table order2 (
		id int,
		ordername varchar(20),
		country varchar(20)
);

insert into order2 values (1, "爱疯", "美国");
insert into order2 values (2, "猴米", "中国");
insert into order2 values (3, "爱国为", "中国");

select * from order2;
select GROUP_CONCAT(id), GROUP_CONCAT(ordername), country from order2 group by country;
