drop table if exists account;
create table account (
		id int primary key auto_increment,
		name varchar(20),
		money int
)engine = innodb auto_increment = 1 default charset = utf8;


insert into account values (null, "大王", 6000);
insert into account values (null, "大黄", 1000);
insert into account values (null, "大白", 3000);
insert into account values (null, "大白2", 4000);