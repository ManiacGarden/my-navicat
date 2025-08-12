drop table if exists userindex;
create table userindex (
		id int primary key auto_increment,
		username varchar(20),
		password varchar(20),
		age int,
		KEY password_index (password) USING BTREE,
		KEY username_index (username) USING BTREE
)engine = innodb auto_increment = 10063003 default charset = utf8;

insert into userindex values (1001, '张飞', '123', 33);
insert into userindex values (1002, '鲁智深', '456', 43);
insert into userindex values (1003, '武松', '999', 62);
insert into userindex values (1004, '李逵', '358', 23);

show create table userindex;
