drop table if exists account;
create table account (
		id int PRIMARY KEY auto_increment,
		name varchar(20),
		age int,
		create_time date
)engine = innodb auto_increment = 1 default charset = utf8;


insert into account values (null, "大王", 43, '2022-07-08');
insert into account values (null, "大黄", 54, '2021-08-18');
insert into account values (null, "大白", 23, '2013-11-08');
insert into account values (null, "大白2", 43, '2018-07-12');