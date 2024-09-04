--Given :



CREATE TABLE DEPT 
(
 DeptNo             Numeric(4) NOT NULL,
 Dname               VARCHAR(14),
 Loc                 VARCHAR(13),
 CONSTRAINT DEPT_PRIMARY_KEY PRIMARY KEY (DEPTNO)
);

INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');


CREATE TABLE Emp (
 EmpNo               Numeric(4) NOT NULL,
 Ename               VARCHAR(10),
 Job               VARCHAR(9),
 Mgr                 Numeric(4) CONSTRAINT Emp_SELF_KEY REFERENCES Emp (EmpNO),
 Hiredate           DATE,
 Sal                 Numeric(7,2),
 Comm                Numeric(7,2),
 Deptno              Numeric(4) NOT NULL,
 CONSTRAINT Emp_FOREIGN_KEY FOREIGN KEY (DeptNo) REFERENCES DEPT (DeptNo),
 CONSTRAINT Emp_PRIMARY_KEY PRIMARY KEY (EmpNo)
);

INSERT INTO Emp VALUES (7839,'KING','PRESIDENT',NULL,'17-NOV-81',5000,NULL,10);
INSERT INTO Emp VALUES (7698,'BLAKE','MANAGER',7839,'1-MAY-81',2850,NULL,30);
INSERT INTO Emp VALUES (7782,'CLARK','MANAGER',7839,'9-JUN-81',2450,NULL,10);
INSERT INTO Emp VALUES (7566,'JONES','MANAGER',7839,'2-APR-81',2975,NULL,20);
INSERT INTO Emp VALUES (7654,'MARTIN','SALESMAN',7698,'28-SEP-81',1250,1400,30);
INSERT INTO Emp VALUES (7499,'ALLEN','SALESMAN',7698,'20-FEB-81',1600,300,30);
INSERT INTO Emp VALUES (7844,'TURNER','SALESMAN',7698,'8-SEP-81',1500,0,30);
INSERT INTO Emp VALUES (7900,'JAMES','CLERK',7698,'3-DEC-81',950,NULL,30);
INSERT INTO Emp VALUES (7521,'WARD','SALESMAN',7698,'22-FEB-81',1250,500,30);
INSERT INTO Emp VALUES (7902,'FORD','ANALYST',7566,'3-DEC-81',3000,NULL,20);
INSERT INTO Emp VALUES (7369,'SMITH','CLERK',7902,'17-DEC-80',800,NULL,20);
INSERT INTO Emp VALUES (7788,'SCOTT','ANALYST',7566,'09-DEC-82',3000,NULL,20);
INSERT INTO Emp VALUES (7876,'ADAMS','CLERK',7788,'12-JAN-83',1100,NULL,20);
INSERT INTO Emp VALUES (7934,'MILLER','CLERK',7782,'23-JAN-82',1300,NULL,10);

CREATE TABLE SALGRADE (
 GRADE               Numeric(2),
 LOSAL               Numeric(8,2),
 HISAL               Numeric(8,2));

INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);

select * from emp;
select * from Dept;
select * from salgrade;

/*

SQL Assignment 4: Joins and Subqueries   */

--1> Display the employee number , name , department number he is working , department name and location of his department 
SELECT EmpNo,Ename,emp.DeptNo,dept.Dname,dept.Loc
FROM Emp,DEPT -- REPLACE DEPT WHEN USING JOIN
--right join DEPT on emp.Deptno = DEPT.DeptNo BUT IT ALSO INCLUDES A NULL ROW
where emp.DeptNo = dept.DeptNo
order by ename

--2>List names ,jobs and deptno of the employee who are having the same job as that of the any empls of dept 20 
SELECT distinct ename,job,dept.DeptNo
from emp,DEPT
where emp.job = (select emp.job where emp.Deptno = 20)
order by job,ename

--3> Display all the departments with the manager for that department.
SELECT DEPT.Dname, Emp.Ename
FROM Emp
RIGHT JOIN DEPT on emp.Deptno = dept.DeptNo
WHERE job = 'MANAGER'

--4> Display the worker names and their grades based on salary range mentioned in salgrade table 
SELECT emp.Ename, SALGRADE.GRADE
from Emp
RIGHT JOIN SALGRADE on (group by emp.Sal and group by salgrade.grade)

--5> Display the worker name and his manager name 
-- eg SMITH works for FORD 
--doubt--
select * from emp 
union
SELECT emp.Ename, DEPT.Dname, Emp.Ename as manager
FROM Emp
RIGHT JOIN DEPT on emp.Deptno = dept.DeptNo
WHERE job = 'MANAGER'
group by Ename,emp.Deptno,DEPT.Dname


-- 6> Department table has department 40, nobody works in this department . 

--show list of all employees from respective departments 

--plus Display the blank row / null rows for this department also 

select emp.ename, dept.Dname, dept.DeptNo
from Emp
full outer join dept on emp.Deptno = DEPT.DeptNo
group by emp.ename, dept.DeptNo, dept.Dname


--7> Display the names and job titles of all employees with the same job as Jones.
select ename,job
from Emp
where job = (select job from emp where ename = 'jones')

--8> Display the name of the employee whose salary is the lowest.
SELECT ename
FROM Emp
WHERE Sal IN (SELECT Min(sal) FROM
emp group by Deptno);

--9>List the employee details who earn highest salary for their job.
SELECT ename
FROM Emp
WHERE Sal IN (SELECT Max(sal) FROM
emp group by Deptno);

--10> Display the names of all employees who work in a department that employs an analyst. 
SELECT ename, dept.Dname
FROM Emp
right join DEPT on emp.Deptno = dept.DeptNo
WHERE emp.Job = 'analyst' 
group by ename, dept.Dname
