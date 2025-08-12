-- 建表语句
drop table if exists user;
create table user (
	id int,
	name varchar(20),
	nickname varchar(20),
	gender varchar(4),
	height int,
	weight int,
	score float,
	birthday date,
	nation varchar(20)
);

-- 增加 年龄这一列
alter table user add age int;

-- 修改身高 为浮点类型
alter table user change height height float;

-- 插入10条数据
insert into user (id, name, nickname, gender, height, weight, score, birthday, nation, age) values
(1, '王天天', '大王', '男', 159.0, 145, 53.5, '2000-01-02', '中国', 15),
(2, '34', '大王', '女', 159.0, 155, 53.5, '2000-01-02', '中国', 15),
(3, '使得法国', '大王', '男', 145.0, 145, 53.5, '1995-01-02', '中国', 23),
(4, 'SDF', '大王', '女', 188.0, 166, 53.5, '2000-01-02', '中国', 43),
(5, '豆腐干', '大王', '其他', 177.0, 145, 53.5, '1998-01-02', '中国', 66),
(6, '大范甘迪', '大王', '男', 155.0, 145, 53.5, '2000-01-02', '中国', 15),
(7, '沃尔特', '的v', '女', 159.0, 145, 53.5, '2000-01-02', '中国', 15),
(8, '发现', '34', '男', 159.0, 145, 53.5, '2000-01-02', '中国', 15),
(9, '内', '大王', '女', 159.0, 145, 53.5, '2000-01-02', '中国', 15),
(10, '王天天', '大王', '男', 159.0, 145, 53.5, '2000-11-02', '中国', 34);

-- 修改id = 10 的名字为'乔峰'
update user set name='乔峰' where id = 10;

-- 修改 id 不为1和2 的性别为 '男'
update user set gender='男' where id not in (1, 2);

-- 自己做出其他练习，超过五条SQL
update user set age = age + 10 where age < 20;
select * from user where age > 60;
select * from user where name like '发现';
select * from user where birthday between '1994-01-02' and '1999-01-02';
update user set nation = null where id = 3;
update user set weight = 230;


select name from user where age > 60;