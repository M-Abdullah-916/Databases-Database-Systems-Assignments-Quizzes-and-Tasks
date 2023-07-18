CREATE TABLE Personnel 
(
	StaffID Char(9) PRIMARY KEY,
	LastName char(15) not null,
	FirstName char(15) not null,
	Birthday char(10),
	Salary int,
	Department char(12) null,
);

Insert into Personnel values('1-11','Smith','Johan','12-2-1989',5000,'Account');
Insert into Personnel values('1-12','Sniha','Jish','15-6-1989',6000,'finance');
Insert into Personnel values('1-13','Dannish','Merry','12-6-1999',7800,'Account');
Insert into Personnel values('1-14','Merry','Zia','12-8-1988',3400,'Account');
Insert into Personnel values('1-15','Jon','Sunan','16-4-1986',6000,'Manufecturer');
Insert into Personnel values('1-16','Smith','hilee','14-6-1999',45000,'Account');
Insert into Personnel values('1-17','Bettica','niha','19-3-1997',3400,'Manufecturer');
Insert into Personnel values('1-18','viee','Johan','1-2-1987',5800,'Manufecturer');
Insert into Personnel values('1-19','saira','Johan','16-2-1986',5500,'Manufecturer');
Insert into Personnel values('1-20','barber','Jon','15-7-1985',5800,'Account');
Insert into Personnel values('1-21','Robert','hood','29-7-1980',5200,'finance');
Insert into Personnel values('1-22','roshan','Johan','2-3-1999',5700,'finance');



/*TASK 1 DB Lab M.Abdullah 19F-0916 SE(4A) */

/*1: Select First name, Last name of the Personnel whose salary is greater than 5000 and less than 7000*/

Select FirstName, LastName
From Personnel
where Salary > '5000' AND Salary < '7000';

/*2: Find total salary pay to the personnel of finance department.*/

Select SUM(Salary) as Total_Salary
From Personnel
where Department='finance';

/*3: Find Personnel whose first name contains a letter A.*/

Select *
From Personnel
where FirstName like '%A%';

/*4: Find the total number of personnel who are getting salary greater than 5000 */

Select COUNT(*) as Total_Number
From Personnel
where Salary > '5000';

/*5: Find the total number of personnel who are getting salary greater than 5000 */

Select COUNT(*) as Total_Number
From Personnel
where Salary > '5000';

/*6: Find Total salary of personnel who are getting salary greater than 55000 */

Select SUM(Salary) as Total_Salary
From Personnel
where Salary > '55000';

/*7: Find the total number of personnel who are getting salary greater than 5000 */

Select COUNT(*) as Total_Number
From Personnel
where Salary > '5000';

/*8: Find Total salary of personnel who are getting salary greater than 55000 */

Select SUM(Salary) as Total_Salary
From Personnel
where Salary > '55000';

/*9: Find First Name, date of birth and salary of employee who are getting salary less than 4000 or their name contain o any where */

Select FirstName , Birthday , Salary
From Personnel
where Salary < '4000' OR FirstName like '%o%';

/*10: Select all the data and arrange it in ascending order. */

Select *
From Personnel
Order by StaffID ASC;

/*11: Find Maximum, Minimum and Avery salary from personnel table. */

Select MAX(Salary) as Max_Salary , Min(Salary) as Min_Salary , AVG(Salary) as Avg_Salary
From Personnel;

/*12: Find First Name, Last Name date of birth and salary of employee who are getting salary more than 5500 or belongs to Account 
      department and name contains h letter or date of bith is in 1998. */

Select FirstName , LastName , Birthday , Salary
From Personnel
where Salary > '5500' or Department = 'Account' AND FirstName like '%h%' OR Birthday like '%1998%';

/*13: Find max Find Maximum, Minimum and Avery salary of each department. */

Select Department , MAX(Salary) as Max_Salary , Min(Salary) as Min_Salary , AVG(Salary) as Avg_Salary 
From Personnel
Group By Department;

/*14: QUESTION NOT GIVEN */

/*15: Find Salary date of birth and First Name of employee that works in either manufacturer department or have date of birth in 1988 */

Select Salary , Birthday , FirstName
From Personnel
where Department = 'Manufecturer' or Birthday like '%1988%';