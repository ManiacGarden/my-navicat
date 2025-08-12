drop table if exists student;
create table student (
		age int,
		class_id int
);

insert into student values (20,1);
insert into student values (30,1);
insert into student values (40,2);
insert into student values (40,2);




select * from student;


select avg(age) from student;


select GROUP_CONCAT(age) from student group by class_id;



select avg(age) from student group by class_id;














