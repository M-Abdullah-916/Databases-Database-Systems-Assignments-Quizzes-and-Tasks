/* 19F-0916 M.Abdullah SE(4A) DB LAB PL SQL */

/* Q1: Write a PL/SQL program to check whether a number is even or odd by using IF END.*/

Declare @Num int = 6;
Begin
	If @Num % 2 = 0
	print 'Given Number is Even'
	Else
	print 'Given Number is Odd'
End

/* Q2: Write a PL/SQL program to check whether a given number is positive, negative or zero IF ELSE END IF.*/

Declare @Num2 int = 6;
Begin
	If @Num2 < 0
	print 'Given Number is a Negative Number'
	Else if @Num2 > 0
	print 'Given Number is a Positive Number'
	Else
	print 'Given Number is a Zero'
End

/* Q3: Write a PL/SQL program to arrange the number of two variable in such a way that the small number will store in num_small variable 
       and large number will store in num_large variable. (SWAPPING)*/

Declare @Num3 int = 3,
		@Num4 int = 6,
		@num_small int,
		@num_large int;
Begin
	If @Num3 < @Num4

	Begin
	Set @num_small = @Num3 
	Set @num_large = @Num4;
	print 'Small Number is = ' + CAST (@num_small AS Varchar(10));
	print 'Large Number is = ' + CAST (@num_large AS Varchar(10));
	End

	Else if @Num3 > @Num4

	Begin
	Set @num_small = @Num4
	Set @num_large = @Num3;
	print 'Small Number is = ' + CAST (@num_small AS Varchar(10));
	print 'Large Number is = ' + CAST (@num_large AS Varchar(10));
	End

	Else
	print 'Given Numbers are equal';

End

/* Q4: Write a program in PL/SQL to print 1st n numbers. */

Declare @Num5 int = 10,
		@i int = 1;
Begin
	while @i <= @Num5
	Begin
	print @i
	Set @i = @i + 1
	End
End

/* Q5: Find the Fibonacci series */

Declare @Num6 int = 7,
		@a int = 1,
		@prev int = 0,
		@next int = 1,
		@add int ;
Begin
	while @a <= @Num6
	Begin

	if @Num6 = 0
	print'0'
	if @Num6 = 1
	print'1'

	Set @add = @prev + @next
	Set @prev = @next
	Set @next = @add;

	print @next
	Set @a = @a + 1
	End
End

/* Q6: Print the following output
     *
    * *
   * * *
  * * * *                              */

Declare @Num8 int = 3,
		@d int = 1,
		@e int = 0,
		@pause2 int = 1;
Begin
	while @d <= @Num8
	Begin

	While @pause2 < @Num8
	Begin
	print ' ' 
	Set @pause2 = @pause2 + 1;
	End

	While @e <> 2* @d-1
	Begin
	print '* '
	Set @e = @e + 1;
	End

	Set @d = @d + 1;
	Set @e = 0;
	Set @pause2 = 1;

	End
End

/* Q7: Print the following result
       *
     * * *
   * * * * *
 * * * * * * *                         */

Declare @Num88 int = 3,
		@dd int = 1,
		@ee int = 0,
		@pause22 int = 1;
Begin
	while @dd <= @Num88
	Begin

	While @pause22 < @Num88
	Begin
	print ' ' 
	Set @pause22 = @pause22 + 1;
	End

	While @ee <> 2* @dd-1
	Begin
	print '* '
	Set @ee = @ee + 1;
	End

	Set @dd = @dd + 1;
	Set @ee = 0;
	Set @pause22 = 1;

	End
End



/* Q8: Solve the problems of trigger in previous assignment */

/* q1 (part l): Create a trigger by name of “Name_Constraint” that prevents the user from entering data in which the “name” attribute 
                contains any value other than an alphabet. For example, name must not contain any numbers, or smybols such as $ etc. */

Create Trigger Name_Constraint
On StudentDetails 
For Insert
AS
Declare @name varchar(10);
Begin
	Select @name = T.NAME From inserted T

	If @name Not between 'A' And 'Z' or @name Not between 'a' And 'z'
	print' Name can only contain Alphabets in it. False Query !!'
	Delete From StudentDetails Where NAME = @name
END

/* q1 (part m): Create a trigger by the name of “Null Constraint” on both above tables that prevents the user from entering data in 
                which any of the attribute of table column contains a NULL value. */

Create Trigger Null_Constraint
On StudentDetails 
For Insert
AS
Declare @name varchar(10), @Id int, @Address varchar(10);
Begin
	Select @name = T.NAME, @Id = T.S_ID, @Address = T.ADDRESS From inserted T

	If @name = Null or @Id = Null or @Address = Null
	print' Query Must contain all elements. No Null is Possible . False Query !!'
	Delete From StudentDetails Where S_ID = @Id
END

Create Trigger Null_Constraintt
On StudentMarks 
For Insert
AS
Declare @name varchar(10), @Id int, @marks int, @Age int;
Begin
	Select @name = T.NAME, @Id = T.ID, @marks = T.MARKS, @Age = T.AGE From inserted T

	If @name = Null or @Id = Null or @marks = Null or @Age = Null
	print' Query Must contain all elements. No Null is Possible . False Query !!'
	Delete From StudentMarks Where ID = @Id
END

/* q3 (part c): Create a trigger on StudentMarks that would fire for INSERT or UPDATE operations performed on the StudentMarks table. 
                This trigger will prevent addition of entries which have less than 0 marks or more than 100 marks. */

Create Trigger Marks
On StudentMarks 
After Insert,Update
AS
Declare  @markss int,@ID int;
Begin
	Select @ID=T.ID, @markss = T.MARKS From inserted T

	if @markss < 0 or @markss > 100
	print' Query Must contain Marks greater than 0 and less than 100. False Query !!'
	Delete From StudentMarks Where ID = @ID
END

/* Q9: Write a program to find if a number is palindrome or not, using loops. */

Declare @Numb int = 12321,
		@revnum int = 0,
		@orinum int ,
		@Split int;
Begin
	Set @orinum = @Numb;

	while @Numb > 0
	Begin
	Set @Split = @Numb % 10
	Set @revnum = @revnum * 10 + @Split
	Set @Numb = @Numb / 10
	End

	if @orinum = @revnum
	print ' Yippiii, Given Number is Palindrome !!! '
	Else
	print ' Alas, Given Number is Not Palindrome !!! '

End

/* Q10: Show the output of the following procedure. */

Create Table emp_temp
( emp_id int,
  emp_email Varchar(40)
);

Declare @number_of_emp int, @ii int = 1;
Begin
	Select Count(emp_id) as number_of_emp
	From emp_temp

	while @ii <= @number_of_emp
	Begin
	insert into emp_temp (emp_id,emp_email)
	Values (@ii, 'not available now');
	End
End