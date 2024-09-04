Topic for MOCK: Complex Queries using Joins and Subqueries

Small Assignment to be solved within 60 Min.
Script Table – Emp	Script Table- Dept 

 drop  table Emp ;
CREATE TABLE EMP (
 EMPNO               INT NOT NULL,
 ENAME               VARCHAR(10),
 JOB                 VARCHAR(9),
 MGR                 INT CONSTRAINT EMP_SELF_KEY REFERENCES EMP (EMPNO),
 HIREDATE            DATE,
 SAL                 int,
 COMM                int,
 DEPTNO              int  NOT NULL,
 CONSTRAINT EMP_FOREIGN_KEY FOREIGN KEY (DEPTNO) REFERENCES DEPT (DEPTNO),
 CONSTRAINT EMP_PRIMARY_KEY PRIMARY KEY (EMPNO)
);

INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,'17-NOV-81',5000,NULL,10);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,'1-MAY-81',2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,'9-JUN-81',2450,NULL,10);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,'2-APR-81',2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,'28-SEP-81',1250,1400,30);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,'20-FEB-81',1600,300,30);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,'8-SEP-81',1500,0,30);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,'3-DEC-81',950,NULL,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,'22-FEB-81',1250,500,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,'3-DEC-81',3000,NULL,20);
INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,'17-DEC-80',800,NULL,20);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,'09-DEC-82',3000,NULL,20);
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,'12-JAN-83',1100,NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,'23-JAN-82',1300,NULL,10);	


CREATE TABLE DEPT 
(
 DEPTNO              INT NOT NULL,
 DNAME               VARCHAR(14),
 LOC                 VARCHAR(13),
 CONSTRAINT DEPT_PRIMARY_KEY PRIMARY KEY (DEPTNO)
);
drop table DEPT

INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');


-- SQL Assignments 

select * from EMP
select * from dept

-- 1.  List the name , comm and job of the employees whose designation are either clerk or salesman
Select ename, comm,JOB from emp where job = 'clerk' or job = 'salesman'

-- 2. List the name and monthly income of the employees belonging to dept no 30.
Select ename, sal from emp where deptNo = '30'

-- 3. List the different types of designations and sort them in ascending order.
Select job from emp group by job order by Job

-- 4. List names ,jobs and deptno of the employee who are having the same job as that of the any employees of dept 20.
Select ENAME, Job, deptNo FROM emp where JOB in (select job from emp where DEPTNO = '20' group by JOB) order by DEPTNO

-- 5. List the name,job deptno and dname for all employees who work in Dallas.
SELECT ename, job,emp.DEPTNO, DEPT.DNAME from emp right join [dbo].[DEPT] on emp.deptNo = dept.deptNo where dept.loc = 'Dallas'

--6. List the employee name , dept  name and location of all employees who earn commission.
SELECT ename, dept.dname, dept.loc from emp, dept where emp.comm is not NULL

--7. Display the department number, total salary pay out and total commission pay out for each department.
select emp.DEPTNO,sum(emp.SAL) as 'Total Salary' ,sum(emp.COMM) 'Total Commision'
from EMP group by emp.DEPTNO

-- 8. List the employee details who earn highest salary for their job.****************
select EMPNO,ENAME,MGR,HIREDATE,COMM,DEPTNO,SAL,emp.JOB
from emp inner join (SELECT max(SAL) 'Max Salary', JOB 
from EMP group by JOB) table_2 on emp.SAL = table_2.[Max Salary]
 
-- 9. Create a view called SALES1 which has all the columns of the EMP table except the salary and commission columns and with only the rows corresponding to employees in department 4444444 30.
CREATE VIEW SALES1 AS
SELECT [EMPNO]
      ,[ENAME]
      ,[JOB]
      ,[MGR]
      ,[HIREDATE]
      ,[DEPTNO]
  FROM [dbo].[EMP]
 WHERE DEPTNO = '30'

 SELECT * FROM SALES1

--10. Create a view called DEPTSUM with two columns called DEPARTMENT and SUMSAL containing the name of each department and the sum of the salaries for all employees in the department. Look at it using a SELECT command. 
-- Now alter one of the salaries in the EMP table using the UPDATE command—is the DEPTSUM aﬀected?
--****************************************************************************************************************8
USE AanshDB
CREATE VIEW DEPTSUM AS
SELECT SUM(EMP.SAL) SUMSAL,[depat].[DNAME] FROM [dbo].[depat] , EMP




