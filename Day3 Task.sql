select * from EMP

select * from DEPT


--1. Retrieve a list of MANAGERS.

select * from EMP where job='manager'

--2. Find out the names and salaries of all employees earning more than 1000 per month.

select ename,salary from EMP where salary > 1000

--3. Display the names and salaries of all employees except JAMES. 
select ename,salary from EMP where ename!='james'

--4. Find out the details of employees whose names begin with ‘S’. 
select * from EMP where ename like's%'

--5. Find out the names of all employees that have ‘A’ anywhere in their name. 
select ename from EMP where ename like'%a%'

--6. Find out the names of all employees that have ‘L’ as their third character in their name
select ename from EMP where ename like'__l%'

--7. Compute daily salary of JONES. 
select salary/30 from EMP where ename='jones'

--8. Calculate the total monthly salary of all employees. 
select sum(salary) from EMP

--9. Print the average annual salary . 
select avg(salary) 'Anuual Average Salary' from EMP where salary<=(select sum(salary)*12 from EMP)

--10. Select the name, job, salary, department number of all employees except SALESMAN from department number 30. 
select ename,job,salary,deptno from EMP where job!='salesman' or deptno!=30
select * from emp

--11.List unique departments of the EMP table. 
select distinct deptno from EMP

--12. List the name and salary of employees who earn more than 1500 and are in department 10 or 30. 
--Label the columns Employee and Monthly Salary respectively
select ename,salary,deptno from EMP where salary>1500 and deptno=10 or deptno=30

--13. Display the name, job, and salary of all the employees whose job is MANAGER or 
--ANALYST and their salary is not equal to 1000, 3000, or 5000. 
select ename,job,salary from EMP where job='manager' or job='analyst' and salary not in(1000,3000,5000)

--14. Display the name, salary and commission for all employees whose commission 
--amount is greater than their salary increased by 10%.
select ename ,salary ,comm from EMP where comm > (salary*0.1)


--15. Display the name of all employees who have two Ls in their name and are in 
--department 30 or their manager is 7782. 
select *  from EMP where ename like '%LL%' and deptno = 30 or mgr_id=7782

--16. Display the names of employees with experience of over 10 years and under 20 yrs.
 --Count the total number of employees. 
 select count(empno)  from EMP 
 where DATEDIFF(YEAR, hiredate, GETDATE()) between 10 and 20

 
--17. Retrieve the names of departments in ascending order and their employees in 
--descending order.
select t1.dname,t2.ename from DEPT t1 join EMP t2 
on t1.deptno=t2.deptno
order by t1.dname asc,t2.ename desc

--18. Find out experience of MILLER. 
select ename,DATEDIFF(YEAR, hiredate, GETDATE()) as 'Experience in Year' from EMP
where ename='MILLER'

