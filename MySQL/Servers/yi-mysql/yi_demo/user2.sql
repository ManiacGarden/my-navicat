drop table if exists user2;
create table user2 (
		id int PRIMARY KEY auto_increment,
		username varchar(20),
		password varchar(20),
		nickname varchar(20)
)auto_increment = 100001 character set utf8 collate utf8_bin;

insert into user2 values (null, '张飞', '123', '燕人');
insert into user2 values (null, '鲁智深', '456', '花和尚');
insert into user2 values (null, '武松', '999', '行者');
insert into user2 values (null, '李逵', '358', '黑旋风');

