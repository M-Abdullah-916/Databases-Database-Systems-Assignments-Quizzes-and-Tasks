CREATE TABLE DEPT1(DEPTNO INT NOT NULL, DNAME CHAR(14),LOC CHAR(13),CONSTRAINT DEPT1_PRIMARY_KEY PRIMARY KEY (DEPTNO));

INSERT INTO DEPT1 VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT1 VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT1 VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT1 VALUES (40,'OPERATIONS','BOSTON');
CREATE TABLE EMP1(EMPNO INT NOT NULL,ENAME CHAR(10),JOB CHAR(9),MGR INT CONSTRAINT EMP1_SELF_KEY REFERENCES EMP1 (EMPNO),HIREDATE DATE,SAL INT,COMM INT,DEPTNO INT NOT NULL,CONSTRAINT EMP1_FOREIGN_KEY FOREIGN KEY (DEPTNO) REFERENCES DEPT1 (DEPTNO),CONSTRAINT EMP1_PRIMARY_KEY PRIMARY KEY (EMPNO));
INSERT INTO EMP1 VALUES (7839,'KING','PRESIDENT',NULL,'17-NOV-1981',5000,NULL,10);
INSERT INTO EMP1 VALUES (7698,'BLAKE','MANAGER',7839,'1-MAY-1981',2850,NULL,30);
INSERT INTO EMP1 VALUES (7782,'CLARK','MANAGER',7839,'9-JUN-1981',2450,NULL,10);
INSERT INTO EMP1 VALUES (7566,'JONES','MANAGER',7839,'2-APR-1981',2975,NULL,20);
INSERT INTO EMP1 VALUES (7654,'MARTIN','SALESMAN',7698,'28-SEP-1981',1250,1400,30);
INSERT INTO EMP1 VALUES (7499,'ALLEN','SALESMAN',7698,'20-FEB-1981',1600,300,30);
INSERT INTO EMP1 VALUES (7844,'TURNER','SALESMAN',7698,'8-SEP-1981',1500,0,30);
INSERT INTO EMP1 VALUES (7900,'JAMES','CLERK',7698,'3-DEC-1981',950,NULL,30);
INSERT INTO EMP1 VALUES (7521,'WARD','SALESMAN',7698,'22-FEB-1981',1250,500,30);
INSERT INTO EMP1 VALUES (7902,'FORD','ANALYST',7566,'3-DEC-1981',3000,NULL,20);
INSERT INTO EMP1 VALUES (7369,'SMITH','CLERK',7902,'17-DEC-1980',800,NULL,20);
INSERT INTO EMP1 VALUES (7788,'SCOTT','ANALYST',7566,'09-DEC-1982',3000,NULL,20);
INSERT INTO EMP1 VALUES (7876,'ADAMS','CLERK',7788,'12-JAN-1983',1100,NULL,20);
INSERT INTO EMP1 VALUES (7934,'MILLER','CLERK',7782,'23-JAN-1982',1300,NULL,10);


/* 19F-0916 M.Abdullah SE(4A) DB Course Assignment */

/* Part 1 Queries with Sub Queries */

/* Q1. Display the employee who got the maximum salary.*/

Select * 
From EMP1
where SAL IN ( Select Max(SAL) From EMP1 )

/* Q2. Display the employees who are working in Sales department.*/

Select *
From EMP1
Where DEPTNO IN (Select DEPTNO From DEPT1 Where DNAME = 'SALES')

/* Q3. Display the employees who are working in “New York”.*/

Select *
From EMP1
Where DEPTNO IN (Select DEPTNO From DEPT1 Where LOC = 'NEW YORK')

/* Q4. Find out no. of employees working in “Sales” department.*/

Select COUNT(*) as Total_Employees
From EMP1
Where DEPTNO IN (Select DEPTNO From DEPT1 Where DNAME = 'SALES')

/* Q5. List out the employees who earn more than every employee in department 30.*/

Select *
From EMP1
Where SAL > (Select MAX(SAL) as Max_Salary 
                From EMP1 
				where DEPTNO IN (Select DEPTNO From DEPT1 where DEPTNO = '30'))

/* Q6. List out the employees who earn more than the lowest salary in department 30.*/

Select *
From EMP1
Where SAL > (Select MIN(SAL) as Min_Salary 
                From EMP1 
				where DEPTNO = '30')

/* Q7. Find out whose department has not employees.*/

Select *
From DEPT1
Where DEPTNO NOT In ( Select DEPTNO From EMP1 )

/* Q8. Find out which department does not have any employees.*/

Select *
From DEPT1
Where DEPTNO NOT In ( Select DEPTNO From EMP1 )

/* Q9. Find out the employees who earn greater than the average salary for their department.*/

Select DISTINCT EName,DEPTNO,SAL
From EMP1, (Select Avg(SAL) as AVG_Salary From EMP1 Where DEPTNO In ( Select DEPTNO From EMP1) Group By DEPTNO) T
Group By EName,DEPTNO,T.AVG_Salary,SAL
Having SAL > T.AVG_Salary


/* Part 2 Queries with Joins */

/* Q1. Display employees with their department name*/

Select ENAME, DNAME
From EMP1, DEPT1 
where EMP1.DEPTNO = DEPT1.DEPTNO

/* Q2. How many employees who are working in different departments and display with department name.*/

Select COUNT(ENAME) as Employees, DNAME
From EMP1 Right Join DEPT1 
On EMP1.DEPTNO = DEPT1.DEPTNO
Group by DNAME

/* Q3. How many employees who are working in sales department.*/ 

Select COUNT(ENAME) as Employees, DNAME
From EMP1, DEPT1 
where EMP1.DEPTNO = DEPT1.DEPTNO AND DEPT1.DNAME = 'SALES'
Group by DNAME

/* Q4. Which is the department having greater than or equal to 5 employees and display the department names in ascending order.*/

Select COUNT(ENAME) as Employees, DNAME
From EMP1, DEPT1 
where EMP1.DEPTNO = DEPT1.DEPTNO 
Group by DNAME
Having COUNT(ENAME) >= 5
Order By DNAME ASC 

/* Q5. List out the total salary of each department*/ 

Select SUM(SAL) as Total_Salary, DNAME
From EMP1 Right Join DEPT1 
On EMP1.DEPTNO = DEPT1.DEPTNO
Group by DNAME

/* Q6. Display employee details with all departments.*/

Select EMP1.*, DNAME
From EMP1 Right Join DEPT1 
On EMP1.DEPTNO = DEPT1.DEPTNO

/* Q7. Display the employee details with their manager names.*/

Select  P.ENAME as Manager_Name ,T.*
From EMP1 P Right Join EMP1 T
On P.EMPNO = T.MGR


/* Q8. Display the employee details who earn more than their managers' salaries.*/

Select P.ENAME as Manager_Name ,T.*
From EMP1 P, EMP1 T
where P.EMPNO = T.MGR AND T.SAL > P.SAL

/* Q9. Show the no. of employees working under every manager.*/

Select COUNT(P.EMPNO) as Total_Employees, T.MGR as Manager_ID
From EMP1 P , EMP1 T
where P.EMPNO = T.MGR
Group By T.MGR