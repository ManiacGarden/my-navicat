-- 新建一个学生表S，有包含如下信息
-- 学号 id，
-- 学生姓名 name，
-- 性别 gender，
-- 年龄 age，
-- 
-- 专业 dept，
-- 
-- 所在系编号 …等
-- 并插入10条数据。
-- 
-- 学号格式为 201801 201802 201803...
-- 性别只有 'male' & 'female'
-- 院系包含（信息系、数学系，计算机科学系 等）
drop table S;
create table S (
	id int PRIMARY KEY auto_increment,
	name varchar(20),
	gender enum('male', 'female'),
	age int,
	dept varchar(20),
	collegeid int,
	college varchar(20)
)auto_increment = 200513 character set utf8 collate utf8_bin;

insert into S values(null, '张大锤', 'male', 38, '文学', 1, '中文系');
insert into S values(null, '刘大锤', 'male', 12, '信息', 6, '信息系');
insert into S values(null, '张大王', 'male', 66, '打游戏', 7, '计算机科学系');
insert into S values(null, '王大好', 'female', 23, '玄学', 1, '中文系');
insert into S values(null, '李大', 'female', 55, '数手指头', 8, '数学系');
insert into S values(201806, '李哈哈', 'male', 38, '挖掘机', 3, '机械学院');
insert into S values(null, '刘锤', 'female', 38, '躺', 4, '家里蹲');
insert into S values(null, '无名','male', 38, '躺', 4, '家里蹲');
insert into S values(null, '李例大立例', 'female', 12, '搬砖', 3, '机械学院');
insert into S values(null, '席立', 'male', 22, '啥都不学', 5, '啥？');

-- -- 1.查询全体学生的学号与姓名。
-- select id, name from s;
-- 
-- -- 3.查询全体学生的详细记录。
-- select * from s;
-- 
-- -- 4.查询全体学生的姓名、出生年份和所属部门 使用列别名改变查询结果的列标题
-- select name as '姓名', age as '年龄', college as '所属部门' from s;
-- 
-- -- 7.查询所有年龄在20岁以下的学生姓名及其年龄。
-- select name as '姓名', age as '年龄' from s where age < 20;
-- 
-- -- 8.查询年龄在20~23岁（包括20岁和23岁）之间的学生的姓名、系别和年龄。
-- select name as '姓名', college as '所属部门', age as '年龄' from s where age BETWEEN 20 and 23;
-- 
-- -- 9.查询年龄不在20~23岁之间的学生姓名、系别和年龄。
-- select name as '姓名', college as '所属部门', age as '年龄' from s where age not BETWEEN 20 and 23;
-- 
-- -- 10.查询信息系、数学系和计算机系学生的姓名和性别。
-- select name as '姓名', gender as '性别' from s where collegeid in (6, 7, 8);
-- 
-- -- 11.查询既不是信息系、数学系，也不是计算机科学系的学生的姓名和性别。
-- select name as '姓名', gender as '性别' from s where collegeid not in (6, 7, 8);
-- 
-- -- 12.查询学号为200518的学生的详细情况。
-- select * from s where id = 200518;

-- 13.查询所有姓刘学生的姓名、学号和性别。
select name as '姓名', id as '学号', gender as '性别' from s where name like "刘%";

-- 14.查询姓“李”且全名为两个汉字的学生的姓名。
select name as '姓名' from s where name like "李__";

-- 15.查询名字中第2个字为“立"字的学生的姓名和学号。
select name as '姓名', id as '学号' from s where name like "_立%";

-- 16.查询所有不姓刘的学生姓名。
select name as '姓名' from s where name not like "刘%";

-- 17.查询学号在201801~201809之间的学生姓名。
select name as '姓名' from s where id BETWEEN 201801 and 201809;

-- 18.查询不同院系学生的人数。
select college, count(*) as '人数' from s group by collegeid;

-- 19.查询不同院系学生的平均年龄，并以降序排序。
select college, count(*) as '人数' from s group by collegeid;

-- 20.查询计算机系年龄在20岁以下的学生姓名。



-- 22.查询全体学生情况，查询结果按所在系的系号升序排列，同一系中的学生按年龄降序排列。