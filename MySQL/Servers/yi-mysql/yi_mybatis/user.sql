drop table if exists user;
create table user (
		id int PRIMARY KEY auto_increment,
		username varchar(20),
		password varchar(20),
		nickname varchar(20)
)engine = innodb auto_increment = 1001 default charset = utf8;

insert into user values (1001, '张飞', '123', '燕人');
insert into user values (1002, '鲁智深', '456', '花和尚');
insert into user values (1003, '武松', '999', '行者');
insert into user values (1004, '李逵', '358', '黑旋风');