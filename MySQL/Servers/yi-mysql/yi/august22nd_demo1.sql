drop table if exists teacher;
create table teacher(
	id int PRIMARY KEY auto_increment,
	name varchar(20),
	class varchar(20)
)auto_increment = 1001 character set utf8 collate utf8_bin;

insert into teacher values (null,"张飞",'一班');
insert into teacher values (null,"关羽",'一班');
insert into teacher values (null,"刘备",'一班');
insert into teacher values (null,"张苞",'二班');
insert into teacher values (null,"阿斗",'二班');
insert into teacher values (null,"关索",'二班');
insert into teacher values (null,"曹操",'三班');
insert into teacher values (null,"荀彧",'三班');
insert into teacher values (null,"郭嘉",'三班');

select * from teacher;

drop table province;
drop table city;

create table province(
	id int PRIMARY KEY,
	name varchar(20)
)character set utf8;

create table city(
	id int PRIMARY KEY,
	name varchar(20),
	p_id int
 
)character set utf8;

select * from province;
select * from city;

insert into province values (32,'江苏');
insert into province values (34,'安徽');
insert into province values (42,'湖北');


insert into city values (1001,'南京', 32);
insert into city values (1002,'扬州', 32);
insert into city values (1003,'蚌埠',34);
insert into city values (1004,'哈哈哈城',38);

-- 笛卡尔积
select * from city cross join province;

-- 内连接隐式
select * from province, city where province.id = city.p_id;
-- 内连接显式
select * from province inner join city on province.id = city.p_id;

-- 左外连接
select * from province left outer join city on province.id = city.p_id;
-- 左外连接
select * from province right outer join city on province.id = city.p_id;