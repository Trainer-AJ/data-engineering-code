--SQL Assignment 2: Order By , Group By , Having By 

SELECT * FROM WORKERS

--1> Find  all those employees who's salaries not yet decided.
--ANS :
SELECT FIRST_NAME, LAST_NAME FROM WORKERS WHERE SALARY IS NULL


--2> Display records of workers from lowest to highest salary 
--ANS ; 
SELECT * FROM WORKERS ORDER BY SALARY
--ANS 2 :
INCASE NULL VALUE NEEDS TO BE EXCLUDED - SELECT * FROM WORKERS WHERE SALARY IS NOT NULL ORDER BY SALARY


--3> Select top 5 workers who are having maximum salary. 
--ANS :
SELECT TOP 5 FIRST_NAME, LAST_NAME FROM WORKERS ORDER BY SALARY DESC

--4> Find the total salary expediture department wise.
--ANS :
SELECT SUM(SALARY) 'TOTAL EXPENSE',DEPARTMENT  FROM WORKERS GROUP BY DEPARTMENT 

--5>Display the total salary , maximum salary and minimum salary department wise 
--ANS :
SELECT SUM(SALARY)'TOTAL EXPENSE',MAX(SALARY) 'MAX SALARY', MIN(SALARY) 'MIN SALARY', DEPARTMENT  FROM WORKERS GROUP BY DEPARTMENT 

--6> Display average salary of departments HR And Admin
--ANS : 
SELECT AVG(SALARY) 'AVERAGE SALARY', DEPARTMENT FROM WORKERS  WHERE DEPARTMENT <> 'ACCOUNT' GROUP BY DEPARTMENT 


--7> Display average salary of departments HR And Admin who are hired before  2020-01-01
--ANS : 
SELECT AVG(SALARY) 'AVERAGE SALARY', DEPARTMENT FROM WORKERS  WHERE DEPARTMENT <> 'ACCOUNT' AND JOINING_DATE < '2020-01-01'GROUP BY DEPARTMENT 

--8> find how many total workers work in organization
SELECT COUNT(WORKER_ID) 'TOTAL EMPLOYEE IN COMPANY' FROM WORKERS

--9>Display how many workers  are there in each department 
select count(worker_id) 'No. of Employee', department from workers group by department 

--10> Display average salary of departments HR and Admin, and average salary salary is less than 500000
/* Average salaery of HR and Admin with individual
salary less than 500000*/
SELECT AVG(salary) 'Average Salary', Department FROM WORKERS WHERE department != 'accounts' and salary < 500000 GROUP BY Department

