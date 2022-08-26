select * from EMP

select * from DEPT



--1. List all employees whose name begins with 'A'. 
select * from EMP where ename like 'A%'

--2. Select all those employees who don't have a manager. 
select * from EMP where mgr_id IS NULL

--3. List employee name, number and salary for those employees who earn in the range 1200 to 1400. 
select ename,empno,salary from EMP where salary between 1200 and 1400

--4. Give all the employees in the RESEARCH department a 10% pay rise. 
--Verify that this has been done by listing all their details before and after the rise. 
select * from EMP
update EMP set salary=salary+(salary*0.10) where deptno=(select deptno from DEPT where dname='RESEARCH')
select * from EMP

--5. Find the number of CLERKS employed. Give it a descriptive heading. 
select job ,count(*) from EMP group by job having job='clerk'

--6. Find the average salary for each job type and the number of people employed in each job. 
select job,count(*) ,avg(salary)'Average Salary' from EMP group by job

--7. List the employees with the lowest and highest salary. 
select min(salary) as 'Minimum Salary',max(salary) as 'Maximum Salary' from EMP

--8. List full details of departments that don't have any employees. 
select * from DEPT where deptno not in (select deptno from EMP)

--9. Get the names and salaries of all the analysts earning more than 1200 who are based in department 20. Sort the answer by ascending order of name. 
select ename as 'Employee Name',salary as 'Salary' from EMP 
where salary>1200 and job='ANALYST' and deptno=20
order by ename

--10. For each department, list its name and number together with the total salary paid to employees in that department. 
select deptno,count(empno) as 'No of Employees', sum(salary) as 'Total Salary' from EMP
group by deptno

--11. Find out salary of both MILLER and SMITH.
select ename,salary as 'Salary' from EMP where ename ='MILLER' or ename='SMITH'

--12. Find out the names of the employees whose name begin with ‘A’ or ‘M’. 
select ename as 'Employee Name' from EMP where ename like '[AM]%'

--13. Compute yearly salary of SMITH. 
select salary*12 as 'Yearly salary',ename from EMP where ename='SMITH'

--14. List the name and salary for all employees whose salary is not in the range of 1500 and 2850. 
select ename,salary from EMP where salary not between 1500 and 2850

--15. display list of managers who have more than 2 employees reporting to them
select count(empno) as 'No of Employees',mgr_id from EMP 
group by mgr_id
having(count(empno)>2)
