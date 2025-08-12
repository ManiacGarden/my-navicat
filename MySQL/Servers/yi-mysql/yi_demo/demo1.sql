drop table if exists student;
drop table if exists clazz;

create table student(
	id int,
	name varchar(20),
	class varchar(20),
	class_id int
)character set utf8 collate utf8_bin;

create table clazz(
	id int,
	name varchar(20)
)character set utf8 collate utf8_bin;

insert into student values (1001,"张飞",'一班',1);
insert into student values (1002,"关羽",'一班',1);
insert into student values (1003,"刘备",'一班',1);
insert into student values (2001,"张苞",'二班',2);
insert into student values (2002,"阿斗",'二班',2);
insert into student values (2003,"关索",'二班',2);
insert into student values (3001,"曹操",'三班',3);
insert into student values (3002,"荀彧",'三班',3);
insert into student values (3003,"郭嘉",'三班',3);

insert into clazz values (1,'一班');
insert into clazz values (2,'二班');
insert into clazz values (3,'三班');

select * from student where class = '一班';

-- 以下为错
-- select 
-- 	*
-- from -- 	(select * from student where class = '一班')
-- where 
-- 	id = 1001;

select id from clazz where name in ('二班', '三班');

select * from student where class_id in
(select id from clazz where name in ('二班', '三班'));