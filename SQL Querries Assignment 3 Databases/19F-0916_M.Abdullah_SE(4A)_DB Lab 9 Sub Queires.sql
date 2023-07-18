Create Table DEPT
(
Dep_id char(4) Primary key,
Dep_Name char(15),
DLocation char(20)
 );

 insert into DEPT values('F12','Finance','North');
 insert into DEPT values('A12','Account','North');
 insert into DEPT values('H12','HR','South');
 insert into DEPT values('M12','Manufecturer','West');
 insert into DEPT values('S12','store','South');
 insert into DEPT values('E12','site1','East');

 Create table EMPL
  (
  E_id int Primary key,
  EName char(15),
  EAddress char(20),
  Conatct_Num int,
  Salary int,
  DNo char(4),
  foreign key(DNO) references DEPT(Dep_id)
 );

 insert into EMPL values(1,'Ali','LHR',1234567,45000,'F12');
 insert into EMPL values(2,'Azhar','LHR',1123231,50000,'F12');
 insert into EMPL values(3,'Zubair','FSD',2212321,35000,'F12');
 
 insert into EMPL values(4,'Zubair','LHR',114545,30000,'A12');
 insert into EMPL values(5,'Zohaib','Fsd',121212,35000,'A12');
 insert into EMPL values(6,'sabir','LHR',110012,38000,'A12');
 insert into EMPL values(9,'Nouman','LHR',114545,30000,'H12');
 insert into EMPL values(8,'Noshair','FSD',114511,40000,'H12');

 Create table SALES
 (
  S_id int Primary key,
  id int,
  ITEM char(15),
  Quantity int,
  sale_price int,
  commission int,
  foreign key(id) references EMPL(E_id)
 );

insert into SALES values(11,1,'Chair',20,10000,150);
insert into SALES values(12,1,'Tables',5,15000,200);
insert into SALES values(13,1,'sofa',5,105000,1500);
insert into SALES values(14,2,'Tables',4,12000,150);
insert into SALES values(15,2,'Dress table',6,100000,1600);
insert into SALES values(16,3,'Tables',10,124000,1800);
insert into SALES values(17,3,'Sofa',10,412000,4500);
insert into SALES values(18,4,'Tables',4,12000,150);
insert into SALES values(19,4,'Dressing Tables',8,215000,2500);
insert into SALES values(20,5,'Dressing Tables',15,715000,6500);

Select * from EMP;
Select * from DEPT;
Select * from SALES;

/* Q1: Display complete details of the employee who got the maximum salary. */

Select * 
From EMPL
where Salary IN ( Select Max(Salary) From EMPL )

/* Q2: Display the employees who are working in Finance department. */

Select *
From EMPL
Where DNo IN (Select Dep_id From DEPT Where Dep_Name = 'Finance')

/* Q3: Using subquery, display the employees who earn more than the average salary of all employees. */

Select *
From EMPL
Where Salary > (Select AVG(Salary) as Average_Sal From EMPL)

/* Q4: Display the employees who are working in “Accountant”. */

Select *
From EMPL
Where DNo IN (Select Dep_id From DEPT Where Dep_Name = 'Account')

/* Q5: Find out no. of employees working in “Store” department. */

Select COUNT(*) as Total_Employees
From EMPL
Where DNo IN (Select Dep_id From DEPT Where Dep_Name = 'store')

/* Q6: List out the employees who earn more than every employee in department HR. */

Select *
From EMPL
Where Salary > (Select MAX(Salary) as Max_Sal 
                From EMPL 
				where DNo IN (Select Dep_id From DEPT where Dep_Name = 'HR'))

/* Q7: List out the employees who earn more than the lowest salary in department F12. */

Select *
From EMPL
Where Salary > (Select MIN(Salary) as Min_Sal 
                From EMPL 
				where DNo = 'F12')

/* Q8: Find out whose department has not employees. */

Select *
From Dept
Where Dep_id NOT In ( Select Dno From EMPL )

/* Q9: Display details of departments in which no employee gets any commission (comm). */

Select *
From Dept
Where Dep_id NOT In ( 
                     Select DNo  
					 From EMPL 
					 where E_id In (Select id From SALES where commission IN (Select commission from SALES )))

/* Q10: Find out the employees who earn greater than the average salary for their department. */

Select DISTINCT EName,Dno,Salary
From EMPL, (Select Avg(Salary) as AVG_Sal From EMPL Where Dno In ( Select Dno From EMPL) Group By Dno) T
Group By EName,Dno,T.AVG_Sal,Salary
Having Salary > T.AVG_Sal

				
/* Q11: Find out all the employees who work in “HR” and have a salary lower than the average salary of all employees. */

Select *
From EMPL
Where DNo In (Select Dep_id From DEPT where Dep_Name = 'HR') AND Salary < (Select AVG(Salary) From EMPL)

/* Q12: List the employees who have department name contains a in their name. */

Select *
From EMPL
Where Dno IN (Select Dep_id From DEPT Where Dep_Name LIKE '%a%')

/* Q13: Count the number of employees who are working in “Finance” Department. */

Select COUNT(*) as Total_Employees
From EMPL
Where DNo IN (Select Dep_id From DEPT Where Dep_Name = 'Finance')

/* Q14: Display the employee details who earn more than HR’ salaries. */

Select *
From EMPL
Where Salary > (Select Max(Salary) 
                From EMPL 
				where Dno in (Select Dep_id From Dept where Dep_Name = 'HR'))

/* Q15: Which is the department having greater than or equal to 3 employees and display the department names in ascending order. */

Select Dep_Name
From DEPT
Where Dep_id IN ( Select Dno From EMPL Group by Dno Having Count(*) >= 3)
Order By Dep_Name ASC

/* Q16: Find the name of department who has paying maximum total salaries to their employees. */

Select Dep_Name
From DEPT
Where Dep_id IN (Select Dno From EMPL Where Salary = (Select Max(Salary) as Max_Sal From EMPL))

/* Q17: Find the name of employee having maximum commission. */

Select EName
From EMPL
Where E_id in (Select id From SALES where commission = (Select Max(commission) From Sales))

/* Q18: Find the name salary and designation of all the employees whose if working in finance department and sold chairs.*/

Select EName , Salary, EAddress
From EMPL
where Dno In (Select Dep_id From DEPT where Dep_Name = 'Finance') And E_id In (Select id From Sales where item = 'Chair')

/* Q19: Find total quantity of chair sold by any Employee. */

Select Quantity, id
From Sales
Where id IN (Select E_id From EMPL) AND ITEM ='Chair'


/* Q20: Find the name salary and designation of employee who is either working in accountant department or sold sofa’s*/

Select EName,Salary,EAddress
From EMPL
where Dno In 
          (Select Dep_id From DEPT where Dep_Name = 'Account') 
		  OR 
     E_id IN (Select id From SALES where ITEM = 'Sofa')