drop table if exists student;
create table student (
		id int,
		name varchar(20),
		age varchar(20),
		gender varchar(20),
		clazz_id int
);

insert into student values (1, '张飞', 23, '男', 1);
insert into student values (2, '司法所', 13, '女', 1);
insert into student values (3, '发呆', 23, '男', 3);
insert into student values (4, '他', 35, '女', 2);
insert into student values (5, '那边', 23, '女', 3);
insert into student values (6, 'io', 28, '男', 4);
insert into student values (7, '认同', 27, '男', 2);
insert into student values (8, '女的', 234, '女', 6)