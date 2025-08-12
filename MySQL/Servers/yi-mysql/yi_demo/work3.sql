-- 创建一个城市表，字段有id、名字、所属国家名字、人口、所属省份
-- 并插入若干数据
drop table cities;
create table cities (
		id int,
		name varchar(20),
		country varchar(20),
		population int,
		province varchar(20)
);

insert into cities values (1, '广州',  '中国', 40, '广东');
insert into cities values (2, '桑嗨',  '中国', 1000, '桑嗨');
insert into cities values (3, 'shengdiyage',  '美国', 40, '阿里送那');
insert into cities values (4, '猫城',  '美国', 100, '阿里送那');
insert into cities values (5, '珠海',  '中国', 40, '广东');
insert into cities values (6, 'qingqing',  '中国', 111, '重庆');
insert into cities values (7, '奥巴马',  '美国', 1111, '华盛顿州');
insert into cities values (8, '深圳',  '中国', 134, '广东');
insert into cities values (9, '东京',  '日本', 200, '日本一个省');
insert into cities values (10, '哈哈',  '德国', 433, '啥');
insert into cities values (11, '德州某个市',  '美国', 22, '德州');
insert into cities values (12, '德州',  '中国', 323, '山东');
insert into cities values (13, '珠海2',  '中国', 2332, '广东');
insert into cities values (14, 'shengdiyage',  '美国', 40, '阿里送那');
insert into cities values (15, 'shengdiyage1',  '美国', 40, '阿里送那');

-- -- 1. 查询所有城市名及人口信息
-- select name, population from cities;
-- -- 2. 查询city表中，所有中国的城市信息
-- select name, population from cities where country = '中国';
-- -- 3. 查询人口数小于100人城市信息
-- select name, population from cities where population < 100;
-- -- 4. 查询中国,人口数超过500的所有城市信息
-- select name, population from cities where country = '中国' and population > 500;
-- -- 5. 查询中国或美国的城市信息
-- select * from cities where country in ('中国', '美国');
-- -- 6. 查询人口数为100-200（包括两头）城市信息
-- select * from cities where population BETWEEN 100 and 200;
-- -- 7. 查询中国或美国，人口数大于500的城市
-- select * from cities where country in ('中国', '美国') and population > 500;
-- -- 8. 查询城市名为qing开头的城市信息
-- select * from cities where name like ('qing%');
-- -- 9. 统计city表的行数
-- select count(*) from cities;
-- 10.统计各国城市的个数
select country, count(*) from cities group by country;
-- 11.统计每个国家的城市总人口数
select country, sum(population) from cities group by country;
-- 12.统计中国每个省的城市个数及城市名列表
select province, group_concat(name), count(*) from cities where country = '中国' group by province;
-- 13.统计每个国家的城市个数,并且只显示超过5个城市的国家
select country, count(*) as total from cities group by country having total > 5;
-- 14.统计每个国家的城市个数,并且只显示超过5个城市的国家并按照从大到小排序
select country, count(*) as total from cities group by country having total > 5 order by population DESC;
-- 15.统计每个国家的城市个数,并且只显示超过5个城市的国家并按照从大到小排序,并且只显示排名前三
select country, count(*) as total from cities group by country having total > 5 order by population DESC limit 0, 2;