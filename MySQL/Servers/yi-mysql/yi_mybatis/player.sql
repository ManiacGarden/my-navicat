drop table if exists player;
create table player (
		id int,
		name varchar(20),
		ballarmy_id int
);

insert into player values (1, '张飞', 1);
insert into player values (2, '大王', 1);
insert into player values (3, '大猫', 3);
insert into player values (4, '李大猫',  2);
insert into player values (5, '李中猫', 3);