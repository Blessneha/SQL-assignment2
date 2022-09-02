create database assign2
use assign2

create table Department(Dept_no varchar(8),Deptname varchar(20),location varchar(20))


insert into Department values('d1','Research','Dallas')
insert into Department values('d2','Accounting','Seattle')
insert into Department values('d3','Marketing','Dallas')
select*from Department

create table Employee(emp int,emp_fna varchar(20),emp_lna varchar(20),Dept_no varchar(8))
insert into Employee values(25348,'Matthew','Smith','d3')
insert into Employee values(10102,'Ann','Jones','d3')
insert into Employee values(18316,'John','Barrimor','d1')
insert into Employee values(29346,'James','James','d2')
select*from Employee
create table Project(project_no varchar(8),project_name varchar(20),Budget int)

insert into Project values('p1','Apollo',120000)
insert into Project values('p2','Gemini',95000)
insert into Project values('p3','Mercury',185600)



create table Works_on(emp_no int,project_no varchar(8),Job varchar(20),enter_date date)

insert into Works_on values(10102,'p1','Analyst','1997.10.1')
insert into Works_on values(10102,'p3','manager','1999.1.1')
insert into Works_on values(25348,'p2','Clerk','1998.2.15')
insert into Works_on values(18316,'p2',NULL,'1998.6.1')
insert into Works_on values(29346,'p2',NULL,'1997.12.15')
insert into Works_on values(2581,'p3','Analyst','1998.10.15')
insert into Works_on values(9031,'p1','Manager','1998.4.15')
insert into Works_on values(28559,'p1',NULL,'1998.8.1')
insert into Works_on values(28559,'p2','Clerk','1992.2.1')
insert into Works_on values(9031,'p3','Clerk','1997.11.15')
insert into Works_on values(29346,'p1','Clerk','1998.1.4')

select Project.project_name,Project.Budget,Works_on.emp_no,Works_on.project_no from Project,Works_on where Project.project_no=Works_on.project_no

select p.*,w.Job from Project p join Works_on w on p.project_no=w.project_no

select p.project_no,p.Budget,w.Job from Project p cross join Works_on w


select Works_on.emp_no,Works_on.Job from Works_on inner join Project on Works_on.project_no=Project.project_no where Project.project_name='Gemini'

select Employee.emp_fna,Employee.emp_lna from Employee left join Department on Employee.Dept_no=Department.Dept_no where Department.Deptname in('Accounting','Research')


select Works_on.enter_date from Works_on inner join Employee on Works_on.emp_no=Employee.emp where Employee.Dept_no='d1'

select Project.project_name from Project inner join Works_on on Project.project_no=Works_on.project_no where Works_on.Job=(select Job from Works_on where Job='Clerk'group by Job having count(*)>2)

select Employee.emp_fna,Employee.emp_lna from Employee join Works_on on Employee.emp=Works_on.emp_no join Project on Project.project_no=Works_on.project_no where Works_on.Job='Manager' and Project.project_name='Mercury'


select distinct e.emp_fna,e.emp_lna from Employee e join Works_on w1 on e.emp=w1.emp_no join Works_on w2 on w1.emp_no<w2.emp_no where w1.enter_date=w2.enter_date


select distinct e.emp from Employee e inner join Department d1 on e.Dept_no=d1.Dept_no inner join Department d2 on d1.Dept_no!=d2.Dept_no where d1.location=d2.location

select Employee.emp from Employee join Department on Employee.Dept_no=Department.Dept_no where Department.Deptname='Marketing'

select Employee.emp from Employee join Department on Employee.Dept_no=Department.Dept_no where Department.Deptname=(select Deptname from Department where Deptname='Marketing')


insert into Employee values(1111,'Julia','Long',NULL)
select * from Employee

create table emp_d1_d2(emp int,emp_fna varchar(20),emp_lna varchar(20),Dept_no varchar(8))

insert into emp_d1_d2 select * from Employee where Employee.Dept_no in('d1','d2')

select*from emp_d1_d2

update Works_on set Job='clerk' where Job='Manager' and Works_on.project_no='p1'

select * from Works_on
update po set Budget=Budget+(0.1*Budget) from Project po join Works_on wo on po.project_no=wo.project_no where wo.Job='manager' and wo.emp_no=10102 

update Project set Budget=NULL

SELECT*from Project

update wo set enter_date='1998.12.12' from Works_on wo join Employee e on wo.emp_no=e.emp where wo.project_no='p1' and e.Dept_no='d1'


