-- 在数据库中创建如下两张表
drop table if exists dept;
create table dept ( 
	deptno varchar(10) primary key, 
	dname varchar(10) 
); 


drop table if exists emp;
create table emp ( 
	empno varchar(10) primary key, 
	ename varchar(10), 
	job varchar(10), 
	mgr varchar(10), 
	sal float, 
	deptno varchar(10) references dept(deptno) 
); 

 
insert into dept values ('1','事业部'); 
insert into dept values ('2','销售部'); 
insert into dept values ('3','技术部'); 
 
insert into emp values ('01','jacky','clerk','tom','1000','1'); 
insert into emp values ('02','tom','clerk','','2000','1'); 
insert into emp values ('07','biddy','clerk','','2000','1'); 
insert into emp values ('03','jenny','sales','pretty','600','2'); 
insert into emp values ('04','pretty','sales','','800','2'); 
insert into emp values ('05','buddy','jishu','canndy','1000','3'); 
insert into emp values ('06','canndy','jishu','','1500','3'); 
select * from dept; 
select * from emp;


select * from dept left outer join emp on dept.deptno = emp.deptno;
		
select * from emp left outer join dept on dept.deptno = emp.deptno;
		
		
-- 列出emp表中各部门的部门号，最高工资，最低工资
select dept.dname, max(emp.sal), min(emp.sal)
		from dept left outer join emp on dept.deptno = emp.deptno
		group by dept.deptno;

-- 列出emp表中各部门job为'CLERK'的员工的最低工资，最高工资
select dept.dname, emp.job, max(emp.sal), min(emp.sal)
		from dept left join emp on dept.deptno = emp.deptno
		where job = 'clerk' group by emp.deptno;

-- 对于emp中最低工资小于2000的部门，列出job为'CLERK'的员工的部门号，最低工资，最高工资 
-- select dept.deptno as dno, min(emp.sal) as minsal from dept left join emp on emp.deptno = dept.deptno group by dept.deptno;
select emp.deptno, emp.ename, tmp.minsal, tmp.maxsal
		from emp left join 
		(select dept.deptno as dno, min(emp.sal) as minsal, max(emp.sal) as maxsal from dept left join emp on emp.deptno = dept.deptno group by dept.deptno) as tmp
		on emp.deptno = tmp.dno
		where tmp.minsal < 2000 and job = 'clerk';
		
-- 根据部门号由高而低，工资有低而高列出每个员工的姓名，部门号，工资
select ename, deptno, sal
		from emp
		order by emp.deptno DESC, sal ASC;
		
-- 列出'buddy'所在部门中每个员工的姓名与部门号
select ename, deptno from emp
		where deptno = 
		(select deptno from emp where ename = 'buddy');

-- 列出每个员工的姓名，工作，部门号，部门名
select emp.ename, emp.job, emp.deptno, dept.dname 
		from emp left outer join dept on emp.deptno = dept.deptno;

-- 列出emp中工作为'CLERK'的员工的姓名，工作，部门号，部门名
select emp.ename, emp.job, emp.deptno, dept.dname
		from emp left outer join dept on emp.deptno = dept.deptno where job = 'clerk'; 
		
-- 对于emp中有管理者的员工，列出姓名，管理者姓名（管理者外键为mgr）
select ename, mgr from emp where mgr != null or mgr != '';

-- 对于dept表中，列出所有部门名，部门号，同时列出各部门工作为'CLERK'的员工名与工作
select dept.dname, dept.deptno, tmp.job, tmp.ename
		from dept left outer join
		(select job, ename, deptno as dno from emp where job = 'clerk') as tmp
		on dept.deptno = tmp.dno;

--  对于工资高于本部门平均水平的员工，列出部门号，姓名，工资，按部门号排序
-- select avg(sal) as avgsal, emp.deptno as tmpdeptno from emp left join dept on emp.deptno = dept.deptno group by dept.deptno;
select deptno, ename, sal
		from emp left join 
		(select avg(sal) as avgsal, emp.deptno as tmpdeptno from emp left join dept on emp.deptno = dept.deptno group by dept.deptno) as tmp
		on emp.deptno = tmp.tmpdeptno
		where emp.sal > tmp.avgsal
		order by emp.deptno;

-- 对于emp，列出各个部门中工资高于本部门平均工资的员工数和部门号，按部门号排序
-- 工资高于本部门平均工资的员工数和部门号
select count(emp.empno), emp.deptno
		from emp left join 
		(select avg(sal) as avgsal, deptno from emp group by deptno) as tmp
		on emp.deptno = tmp.deptno
		where emp.sal > tmp.avgsal
		group by emp.deptno
		order by emp.deptno;
-- 方法二
select empno, sal,  from emp as a1 where a1.sal > (
select avg(sal) from emp as a2 where a2.deptno = a1.deptno
);
