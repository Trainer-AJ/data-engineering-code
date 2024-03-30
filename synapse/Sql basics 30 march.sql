-- ( * ) means everything 
-- select columnname FROM TABLENAME 
-- EVery column 

select * from [SalesLT].[Product]

select Name,StandardCost FROM [SalesLT].[Product]
-- number of rows 
select COUNT(*) from [SalesLT].[Product]
-- 295 
select count(*) FROM [SalesLT].[Product] Where ProductID Between 680 and 800
-- 96 

-- Whatever is written before or after road just print it 
select * From [SalesLT].[Product] where Name like '%Road%'

-- HL **Road** Frame - Black, 58
-- HL **Road** Frame - Red, 58
-- Sport-100 Helmet, Red

-- ORDER by to arrange ==> by default its assending 
select TOP 10 * From [SalesLT].[Product] where Name like '%Road%' Order By ListPrice DESC

select MAX(ListPrice) From [SalesLT].[Product] where Name like '%Road%'

-- Show Number of Products with unique colours
-- like 100 items for Red

-- Raw Data 
select Count(ProductId),color From [SalesLT].[Product] where Name like '%Road%' Group by Color 

-- Transform
select Count(ProductId) As 'Number of Products',color 
From [SalesLT].[Product] 
where Name like '%Road%' and color is not null 
Group by Color 

/*
=========================================================
 How to Create Table 

 1. Specify schema = Rules 
 2. Insert values into that table 
========================================================
*/

-- CREATE SCHEMA

/* CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....
); */

CREATE TABLE Course (
CourseID varchar(100) Not Null,
CourseName varchar(1000),
Price int,
LaunchDate Date,
Primary Key (CourseID) ) 

-- Primary Key = Aadhar Card  

select * from [dbo].[Course]

Insert Into  Course (
CourseID,
CourseName,
Price,
LaunchDate)  
Values 
('DP-203', 'Data Engineering', '7000', '2024-03-30' )


