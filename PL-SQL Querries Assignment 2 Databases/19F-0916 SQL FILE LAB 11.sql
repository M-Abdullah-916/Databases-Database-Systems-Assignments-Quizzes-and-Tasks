/* M.Abdullah SE(4A) 19F-0916 DB LAB 11 DDL */

/* Question No: 1 */

/*  a: Creating StudentDetails Table and Inserting Data into it */
Create Table StudentDetails
(
	S_ID int Primary Key,
	NAME char (15) not null,
	ADDRESS char (30),
);

Insert Into StudentDetails Values (1,'Harish','Kolkata')
Insert Into StudentDetails Values (2,'Ashish','Durgapur')
Insert Into StudentDetails Values (3,'Pratik','Delhi')
Insert Into StudentDetails Values (4,'Dhanraj','Bihar')
Insert Into StudentDetails Values (5,'Ram','Rajasthan')

/* b: Creating StudentMarks Table and Inserting Data into it */

Create Table StudentMarks
(
	ID int Primary Key,
	NAME char (15) not null,
	MARKS int not null,
	AGE int,
);

Insert Into StudentMarks Values (1,'Harish',90,19)
Insert Into StudentMarks Values (2,'Ashish',50,20)
Insert Into StudentMarks Values (3,'Pratik',80,19)
Insert Into StudentMarks Values (4,'Dhanraj',95,21)
Insert Into StudentMarks Values (5,'Ram',85,18)


/* c: Creating View on StudentDetails Table  */

Create View DetailsView 
As Select NAME, ADDRESS 
   From StudentDetails
   Group by NAME, ADDRESS, S_ID
   Having S_ID < 5

/* d: Displaying DetailsView on StudentDetails Table  */

Select * From DetailsView

/* e: Creating View on StudentDetails Table and Applying Ordering */

Create View StudentNamesView 
As Select TOP 99.9999 percent S_ID, NAME
   From StudentDetails
   Order By NAME ASC

/* f: Displaying StudentNamesView on StudentDetails Table  */

Select * From StudentNamesView

/* g: Creating MarksView on StudentDetails and StudentMarks Table  */

Create View MarksView 
As Select S.NAME, S.ADDRESS , M.MARKS
   From StudentDetails S , StudentMarks M
   Where S_ID = ID

/* h: Displaaying MarksView on StudentDetails and StudentMarks Table  */

Select * From MarksView

/* i: Marks Greater than 80 in MarksView */

Select * From MarksView
Group By NAME, ADDRESS, MARKS
Having MARKS >= 80

/* j: Maximum Marks in MarksView */

Select Marks, Name
From MarksView
Where MARKS = ( Select Max(MARKS) From MarksView)

/* k: Droping MarksView */

Drop View MarksView


/* Question No: 2 */

/* a: Creating and Inserting Values into StaudentMarks Table */

Create Table StaudentMarks
(
	ID int Primary Key,
	NAME char (15) not null,
	MARKS int not null,
	AGE int,
);

Insert Into StaudentMarks Values (1,'Harish',90,19)
Insert Into StaudentMarks Values (2,'Suresh',50,20)
Insert Into StaudentMarks Values (3,'Pratik',80,19)
Insert Into StaudentMarks Values (4,'Dhanraj',95,21)
Insert Into StaudentMarks Values (5,'Ram',85,18)

Select * From StaudentMarks

/* b: Deleting Name = Ram */

Delete 
From StaudentMarks
Where NAME = 'RAM'

/* c: Updating Marks=92 where ID is 1 */

Update StaudentMarks
Set Marks = 92
Where ID = 1

/* Question No: 3 */

/* a: Creating and Inserting Values into StaudentMarks Table */

Create Table StaudentMarks
(
	ID int Primary Key,
	NAME char (15) not null,
	MARKS int not null,
	AGE int,
);

Insert Into StaudentMarks Values (1,'Harish',90,19)
Insert Into StaudentMarks Values (2,'Suresh',50,20)
Insert Into StaudentMarks Values (3,'Pratik',80,19)
Insert Into StaudentMarks Values (4,'Dhanraj',95,21)
Insert Into StaudentMarks Values (5,'Ram',85,18)

Select * From StaudentMarks