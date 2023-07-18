/*creating Department Table */
Create table DEP
(
  DId char(5) primary key,
  DName char(10),
  
);
insert into DEP values('cs101','Comp.Sci');
insert into DEP values('EE102','Elect.Eng');
insert into DEP values('BBA','Business');

/*creating EMPLOYEE Table */

Create table EMP
(
  Eid int primary key,
  EName char(10),
  EAddress varchar(20),
  Salary int,
  Dno char(5),
  Foreign key(Dno) references DEP(DId)
);

/* Insert Data */
insert into EMP values(1,'Ali','FSD',35000,'CS101');
insert into EMP values(2,'Akber','FSD',36000,'CS101');
insert into EMP values(3,'zeeshan','LHR',45000,'EE102');

insert into EMP values(4,'Nauman','FSD',50000,'CS101');
insert into EMP values(5,'Raheem','LHR',40000,'EE102');
insert into EMP values(6,'Kareem','FSD',25000,'CS101');
insert into EMP values(7,'Fahad','LHR',14000,'EE102');
insert into EMP values(8,'Nazir','LHR',25000,'EE102');
insert into EMP values(9,'Rizwan','LHR',38000,'EE102');
insert into EMP values(10,'Mubashir','',8000,'CS101');
insert into EMP values(11,'Hamid','',7000,'EE102');


/* TASK 1 Queries */

/* 1: Find the average salary of each department. */

Select Dno, AVG(Salary) as Average_Salary
From EMP
Group by Dno;


/* 2: Find total number of employees working in each department and total salary paid to all employee in the same department. */

Select Dno, Sum(Salary) as Total_Sal, Count(Eid) as Total_Emp
From EMP
Group by Dno;


/* 3: Find max salary paid by each department. */

Select Dno, Max(Salary) as Max_Paid_Sal
From EMP
Group by Dno;


/* 4: Find the Department number of departments that paid maximum salary to their EMPLOYEEs. */

Select Dno, Max(Salary) as Max_Paid_Sal
From EMP
Group by Dno;


/* 5: Find the record of employees whose name contains ‘h’ in their name. */

Select *
From EMP
Where EName Like'%h%';


/* 6: Find the name of all employees who are not working in any department (hint use is null) */

Select EName, EAddress
From EMP
Where EAddress = '';


/* 7: Find the name of employees who has highest salary in each department. */

Select  DISTINCT EMP.EName, EMP.Dno
From EMP
where Eid IN (Select Dno,Max(Salary) as Maximum_Salary
              From EMP
              Group by Dno,Eid)
Group by EMP.Dno, EMP.EName;

Select EName
From EMP
Where Salary >= ( Select Max(Salary) From Emp)
Group By Dno, EName

/* 8: Find the record of employee who is earning more than every employee in all department. */

Select * 
From EMP
Where Salary >= ( Select Max(Salary) From Emp)









Create Table Product
(
  Pid int Primary key,
  PName char(15) not null,
  P_Desc Varchar(40),
  Price int,
  Discount char(4),
  Uni_code char(5)
  );

  insert into Product values(112,'Painter','   Power Painter 15, psi' ,3400,'5%','cs111');
  insert into Product values(113,'INK','Power Ink 1/3 osi' ,3100,'4%','cs121');
  insert into Product values(114,'Washing Powder','Powder  1/3 osi' ,1100,'4%','cs131');
  insert into Product values(115,'Cloth','cloth  1/4 inches' ,3100,'4%','cs131');
  insert into Product values(116,'Cloth','cloth 1/2 inches' ,3100,'4%','cs132');
  insert into Product values(117,'  PVC Pipe','PVC Pipe 3.5 inches' ,1500,'4%','cs141');
  insert into Product values(118,'Steel','steel mating 2*4*5 matting' ,3100,'4%','cs441');
  insert into Product values(119,'Metal Screw','Metal screw  1/2 inches  ' ,3100,'4%','cs44');



  /* TASK 2 Queries */

   /* STRING FUNCTIONS */

/* 1: Concatenation. */

Select CONCAT (Pid, '     ', PName, Price) as CONCATENATION
From Product


/* 2: Upper and Lower */

Select Upper(PName) as Upper_Case
From Product

Select Lower(PName) as Lower_Case
From Product


/* 3: SubString */

Select PName, substring (PName , 1 ,5 ) as SubString_Value
From Product


/* 4: Length */

Select Len(PName) as Length_of_Attributes, PName 
From Product


/* 5: Right and Left */

Select Right(PName,6) as Right_Intendation, PName
From Product

Select Left(PName,2) as Left_Intendation , PName
From Product


/* 6: RTRIM LTRIM AND TRIM */

Select LTRIM(PName) as LEFT_TRIM, PName
From Product

Select RTRIM(PName) as RIGHT_TRIM, PName
From Product

Select TRIM(PName) as WHOLE_TRIM, PName
From Product

/* 7: Replace Reverse and Replicate */

Select Replace(PName,'l','L') as Replaced_Values, PName
From Product

Select Reverse(PName) as Reversed_Values, PName
From Product

Select Replicate(PName,2) as Replicated_Values, PName
From Product

 /* NUMERIC FUNCTIONS */

/* 1: ABSOLUTE VALUE */

Select DISTINCT ABS(T.SQRT_PRICE) as ABS_VALUE, Price
from Product, (Select SQRT(Price) as SQRT_PRICE
               From Product ) T


/* 2: ROUND */

Select DISTINCT ROUND(T.SQUARE_ROOT, Price) as ROUND_VALUE, Price
from Product, (Select SQRT(Price) as SQUARE_ROOT
               From Product ) T


/* 3: CEILING AND FLOOR */

Select CEILING('2.2')
Select FLOOR('2.2')


Select CEILING(T.AVG_PRICE)
From (Select SQRT(Price) as AVG_PRICE
               From Product ) T

Select FLOOR(T.AVG_PRICE)
From (Select SQRT(Price) as AVG_PRICE
               From Product ) T


/* 4: SQRT TAN */

Select SQRT(Price) as SQUARE_ROOT
From Product

Select TAN(Price) as SQUARE_ROOT
From Product
