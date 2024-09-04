--SQL Assignment 3 : System Defined Functions


--1>Display the Return the current date and time both 
Select GetDate() AS 'Current DATE and Time'

--2> Find out the index of 't' from a string Customer
SELECT 
    CHARINDEX('t', 'customer') 'position of t';

--3> Find out the lenth of 'Synergetics Pvt Ltd'
Select LEN('Synergetics Pvt Ltd')

--4> Convert the text to lower case  'Synergetics Pvt Ltd!!' 
Select LOWER('Synergetics Pvt Ltd').

--5> display the reverse of 'Synergetics Pvt Ltd'.
SELECT REVERSE('Synergetics Pvt Ltd')

--6>Display only  'Synergetics' from text ' Synergetics Pvt Ltd'.
SELECT SUBSTRING('Synergetics Pvt Ltd', 1,11) AS ExtractString;

--7>Find 6 raised to the third power value 
Select power(6,3) 

--8> Round the number 456.789  to 2 decimal places:
SELECT ROUND(456.789, 2)

--9>Add one year to a date - 2020/03/13 , then return the date:
SELECT DATEADD(year, 1, '2017/08/25') 

--10>Display the difference between  two date i.e 2020/03/13 and  2015/08/25 , in years:
SELECT DATEDIFF(year, '2020/03/13', '2015/08/25')

--11> convert a string '2020-03-10' to a datetime value -  Using the CAST() function 
select cast('2020/03/10' as datetime)
