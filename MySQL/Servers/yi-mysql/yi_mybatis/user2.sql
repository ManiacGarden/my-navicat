drop table if exists user2;
create table user2 (
		id int PRIMARY KEY,
		username varchar(20),
		nickname varchar(20),
		gender varchar(20),
		age int
);

insert into user2 values (1001, '张飞', '但是复苏的', '男', 12);
insert into user2 values (1002, '鲁智深', '对方是否', '男', 34);
insert into user2 values (1003, '武松', '对方', '男',35);
insert into user2 values (1004, '李逵', '二恶', '男', 83);