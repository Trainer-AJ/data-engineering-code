/*
1. Create the table Customer with the following Columns:
CustomerId		int ,
CustomerName  	Varchar(30),
Address1		Varchar (30)
Address2		varchar (30) */

CREATE TABLE Customers (
CustomerId		int ,
CustomerName  	Varchar(30),
Address1		Varchar (30),
Address2		varchar (30)
);


2./* Modify the customer table Customername column of datatype with varchar2(30) and Name 
Should not accept Nulls */
alter table customers alter column CustomerName varchar(30) NULL


/*3. Add the following columns to the customer table 
Sex		varchar(1)
Age 		int
PhoneNo 	int
Income 		int */
alter table customers ADD
Sex			Varchar(1),
Age 		int,
PhoneNo 	int,
Income 		int ;

/* 4. Insert rows with the following data into the customer table 
1000,Allen,#115Chicago,#115Chicago,M,25,7878776,1000
1001,George,#116France,#114France,M,25,434524,2000
1002,Becker,#114 New York,#114 New York,M,45,431525,15000 */

INSERT INTO Customers (CustomerId,CustomerName,Address1,Address2,Sex,Age,PhoneNo,Income)
values (1000,'Allen','#115Chicago','#115Chicago','M',25,7878776,1000),
(1001,'George','#116France','#114France','M',25,434524,2000),
(1002,'Becker','#114 New York','#114 New York','M',45,431525,15000);

select * from customers

/*delete top(2) from customers
delete from customers where CustomerId in (1000,1001,1002) --deletes all 6 rows */



-- 5. change the income of customer Id 1002 from 15000 to 25000 */
update Customers set income = 25000 where CustomerId = 1002
 
