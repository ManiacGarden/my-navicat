-- 某大学研究生院有若干研究生导师，包括职工编号、姓名、职称、研究方向，其中每个导师的职工编号是唯一的。
-- 若干研究生，包括学号、姓名、性别、入学日期，其中每个研究生的学号是唯一的。
-- 每个导师可以带若干研究生，但每个研究生只能有一个导师。
-- 请设计一个数据库，要求可以正确体现导师和研究生之间的关系。
-- 设计完毕之后，请插入一定量的数据，并验证你设计的数据库是否满足要求。
drop table if exists tutor;
drop table if exists student;

create table tutor (
		id int PRIMARY KEY auto_increment,
		name varchar(20),
		title varchar(20),
		direction varchar(20)
)auto_increment = 1000;

create table student (
		id int PRIMARY KEY auto_increment,
		name varchar(20),
		gender varchar(20),
		entrydate date,
		tutorid int
)auto_increment = 2000;

insert into tutor values (null, '超师', '超级导师', '上火星');
insert into tutor values (null, '特师', '特级导师', 'high power laser gun');
insert into tutor values (null, '顶师', '顶级导师', 'high power laser gun');
insert into tutor values (null, '绝师', '绝世导师', 'high power laser gun');


insert into student values (null, '大王', '男', '2022-05-05', 1000);
insert into student values (null, '大白', '女', '2022-05-25', 1000);
insert into student values (null, '小黑', '男', '2022-05-05', 1001);
insert into student values (null, '旺财', '女', '2022-08-05', 1002);
insert into student values (null, '大概', '男', '2022-05-15', 1002);
insert into student values (null, '42', '男', '2022-05-05', 1001);
insert into student values (null, '大幅度', '女', '2022-03-05', 1002);

-- 1.请查出每个导师所带研究生的姓名。
select tutor.name, group_concat(student.name) as students from tutor left join student on tutor.id = student.tutorid group by tutor.name;
-- 2.清查出特定姓名的导师所带研究生的姓名。
select tutor.name, group_concat(student.name) as students from tutor left join student on tutor.id = student.tutorid  where tutor.name = "聪明绝顶" group by tutor.name;
-- 3.请查出每个导师所带研究生的数量。
select tutor.name as tname, count(student.id) as stuCount from tutor left join student on tutor.id = student.tutorid group by tutor.name;
-- 4.请查出每个导师所带的男研究生的数量。
select tutor.name, count(student.id) from tutor left join student on tutor.id = student.tutorid where student.gender = '男' group by tutor.name;
-- 5.请找出选择哪个研究方向的导师最多。
select direction, count(*) from tutor group by direction order by count(*) DESC limit 0, 1;
-- 6.请找统计不同职称的导师的个数。
select title, count(*) from tutor group by title;