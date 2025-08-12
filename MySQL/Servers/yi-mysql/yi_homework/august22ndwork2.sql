drop table if exists student;
create table student(
	id int,
	name varchar(20),
	chinese float,
	english float,
	math float
);

-- 请添加2列信息，出生日期，籍贯。
alter table student add birthday date;
alter table student add city varchar(20);

-- 请修改语文成绩的数据类型为int型
alter table student change chinese chinese int;

-- 请在里面插入10名学生数据
-- alter table student modify name varchar(20) [character set utf8 collate utf8_bin]
alter table student character set gbk collate gbk_bin;
insert into student (id, name, chinese, english, math, birthday, city) values (1, "事实上", 69, 99, 33, '2000-12-12', "保定");
insert into student (id, name, chinese, english, math, birthday, city) values (1, "王实上", 69, 99, 33, '2000-12-12', "保定");
insert into student (id, name, chinese, english, math, birthday, city) values (1, "事实上", 69, 99, 33, '2000-12-12', "河北");
insert into student (id, name, chinese, english, math, birthday, city) values (1, "王实上", 69, 33, 33, '2000-12-12', "保定");
insert into student (id, name, chinese, english, math, birthday, city) values (1, "里实上", 39, 99, 33, '2000-12-12', "保定");
insert into student (id, name, chinese, english, math, birthday, city) values (1, "的实上", 69, 99, 33, '2000-12-12', "百京");
insert into student (id, name, chinese, english, math, birthday, city) values (1, "是实上", 55, 49, 33, '2000-12-12', "桑嗨");
insert into student (id, name, chinese, english, math, birthday, city) values (1, "对方实上", 69, 99, 99, '2000-12-12', "保定");
insert into student (id, name, chinese, english, math, birthday, city) values (1, "发的实上", 69, 99, 33, '2000-12-12', "保定");

-- 1. 假设10名同学中有同姓的，如王，请找出姓王同学的信息
-- 2. 请找出各科不及格学生的信息
-- 3. 请找出有任何一科不及格学生的名称
-- 4. 请找出两科成绩在90分以上的学生名称
-- 5. 请找出没有一科挂科的学生名称

select * from student where name like '王%';
select * from student where chinese < 60 and english < 60 and math < 60;
select * from student where chinese < 60 or english < 60 or math < 60;
select * from student where (chinese > 90 and english > 90) or (chinese > 90 and math > 90) or (math > 90 and english > 90);
select name from student where chinese >= 60 and english >= 60 and math >= 60;

select group_concat(name) as names, city from student group by city;