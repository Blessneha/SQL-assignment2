use assign2


CREATE VIEW [emp_view] AS
SELECT emp, emp_fna,emp_lna
FROM Employee

select*from emp_view
alter view emp_view as select emp_fna,emp_lna from Employee
insert into emp_view values('Blessy','John')
sp_helptext emp_view
