- [MS DOCS -- T SQL](https://docs.microsoft.com/en-us/sql/t-sql/lesson-1-creating-database-objects?view=sql-server-ver15)
- [SQL build in functions](https://www.sqlservertutorial.net/sql-server-system-functions/)

## What and Why RDBMS 


## How Query Process 
[From GFG](https://www.geeksforgeeks.org/sql-query-processing/)

## Structure 
[GFG](https://www.geeksforgeeks.org/introduction-of-3-tier-architecture-in-dbms-set-2/)

## Data types 
![](https://www.sqlservertutorial.net/wp-content/uploads/SQL-Server-Data-Types-768x784.png)
[More here](https://www.sqlservertutorial.net/sql-server-basics/sql-server-data-types/)
## Schema on read 

![](https://media-geeksforgeeks-org.cdn.ampproject.org/ii/w680/s/media.geeksforgeeks.org/wp-content/uploads/20201013102054/Hadoop_Schema_on_Read.png)

[REFER GFG](https://www.geeksforgeeks.org/what-is-schema-on-read-and-schema-on-write-in-hadoop/)

## Common terms 

SQL Server uses schemas to logically groups tables and other database objects. In our sample database, we have two schemas: sales and production. The sales schema groups all the sales-related tables while the production schema groups all the production-related tables.

constraints are the set of rules that ensures that when an authorized user modifies the database they do not disturb the data consistency and the constraints are specified within the DDL commands like “alter” and “create” command.

SQL server storage engine is software used to create, read and update data between the disk and memory. The SQL server maps the database with files that store database objects, tables and indexes

- `Clause` : A clause in SQL is a part of a query that lets you filter or customizes how you want your data to be queried to you
------_---------

There is no concept of a first row, a second row, or a last row. Elements may be accessed (and retrieved) in any order. If you need to return results in a certain order, you must specify it explicitly by using an ORDER BY clause in your SELECT query.

FQDN -- Server1.StoreDB.Sales.Order

When working with tables within the context of a single database, it's common to refer to tables (and other objects) by including the schema name. For example, Sales.Order

SQL statements are grouped together into several different types of statements. These different types are:

Data Manipulation Language (DML) is the set of SQL statements that focuses on querying and modifying data. DML statements include SELECT, the primary focus of this training, and modification statements such as INSERT, UPDATE, and DELETE.

Data Definition Language (DDL) is the set of SQL statements that handles the definition and life cycle of database objects, such as tables, views, and procedures. DDL includes statements such as CREATE, ALTER, and DROP.

Data Control Language (DCL) is the set of SQL statements used to manage security permissions for users and objects. DCL includes statements such as GRANT, REVOKE, and DENY


## Basics 

- `Projection vs Selection` -- Projection means choosing which columns (or expressions) the query shall return.

Selection means which rows are to be returned.

if the query is
```sql
select a, b, c from foobar where x=3;
```
then "a, b, c" is the projection part, "where x=3" the selection part.

- `operators in SQL` : What is an Operator in SQL?
An operator is a reserved word or a character used primarily in an SQL statement's WHERE clause to perform operation(s), such as comparisons and arithmetic operations. 

- `aggregation in SQL` : "An aggregate function performs a calculation on a set of values, and returns a single value. Except for COUNT(*), aggregate functions ignore null values. Aggregate functions are often used with the GROUP BY clause of the SELECT statement.

All aggregate functions are deterministic."
 [More in MS DOCS](https://docs.microsoft.com/en-us/sql/t-sql/functions/aggregate-functions-transact-sql?view=sql-server-ver15#:~:text=An%20aggregate%20function%20performs%20a,All%20aggregate%20functions%20are%20deterministic.)

**Aggerator Example** --
```sql
select count(Distinct CarName) from CAR -- count no. of rows with distinct values
select CARID, CarName from CAR group by CarName,CARID order by CARID -- confirmm the result with this followed by select * from CAR
```

`AS for renaming Purpose` -
```sql
-- get the answer of the count clause and avg cluase under respective column name
select count(*) as 'total rows', AVG(CARID) as 'avg value' from CAR
```
**Basic operators with select**
```sql
-- we use `AS` because it will create new column with new values in there 
SELECT (CARID*2)+1 as '2x carid',CarName FROM CAR
-- confirm your results
select * from CAR
```
**Group by to group the duplicate entries together**--

```sql
SELECT
    city,
    COUNT (customer_id) customer_count -- renaming the new column
FROM
    sales.customers
GROUP BY
    city
ORDER BY
    city;
```

In this example, the GROUP BY clause groups the customers together by city and the COUNT() function returns the number of customers in each city.
## Data types in SQL
[tutorials point](https://www.tutorialspoint.com/sql/sql-data-types.htm])

## SQL indexing 

SQL query --> CPU (Millions Instructions per Second) : recieves and process the request ---> RAM (temporary memory) : CPU TOO fast HDD slow so RAM interacts with both ----> Hard disk (data divided in equal size Block)

CPU checks if the block contains the data required or not. If yes recieves block and forward that to CPU (hit) Else returns the block back to HDD (fail) -- IO cost 

![]()

When you create a table with a primary key, SQL Server automatically creates a corresponding clustered index based on columns included in the primary key.

If you add a primary key constraint to an existing table that already has a clustered index, SQL Server will enforce the primary key using a non-clustered index:

In case a table does not have a primary key, which is very rare, you can use the CREATE CLUSTERED INDEX statement to define a clustered index for the table.

```sql

CREATE CLUSTERED INDEX ix_parts_id
ON production.parts (part_id);  

```

## Non Clustered Index

```sql
-- this command create a non clustered index
CREATE INDEX ix_customers_city
ON sales.customers(city);
```

When you create a nonclustered index that consists of multiple columns, the order of the columns in the index is very important. You should place the columns that you often use to query data at the beginning of the column list.

## renaming Indexes
For example, the following statement renames the index ix_customers_city of the sales.customers table to ix_cust_city:

```sql
EXEC sp_rename 
        @objname = N'sales.customers.ix_customers_city',
        @newname = N'ix_cust_city' ,
        @objtype = N'INDEX';

```

After you create a `unique index` you will not be able to insert duplicate values into the table i.e duplicate combination like (1,1) cannot be inserted again while 1,2 can be inserted EVEN NULL CAN NOT BE REPEATED 

```sql
CREATE UNIQUE INDEX ix_uniq_ab 
ON t1(a, b);
```

## SQL COMMNADS 


![](https://www.sqlservertutorial.net/wp-content/uploads/SQL-Server-OFFSET-FETCH.png)

`Example` -- To get the top 10 most expensive products you use both OFFSET and FETCH clauses:
```sql
SELECT
    product_name,
    list_price
FROM
    production.products
ORDER BY
    list_price DESC,
    product_name 
OFFSET 0 ROWS 
FETCH FIRST 10 ROWS ONLY;

```
## Having 
The HAVING clause is often used with the GROUP BY clause to filter groups based on a specified list of conditions.

```sql
SELECT
    select_list
FROM
    table_name
GROUP BY
    group_list
HAVING
    conditions;

```

#### check for duplicate email

```sql
SELECT 
    email, 
    COUNT(email)
FROM 
    sales.customers
GROUP BY 
    email
HAVING 
    COUNT(email) > 1;
```

## Table 
```sql
CREATE TABLE sales.visits (
    visit_id INT PRIMARY KEY IDENTITY (1, 1), -- says start from 1 then increase by 1 
    first_name VARCHAR (50) NOT NULL, -- not null is constraints here 
    last_name VARCHAR (50) NOT NULL,
    visited_at DATETIME,
    phone VARCHAR(20),
    store_id INT NOT NULL,
    FOREIGN KEY (store_id) REFERENCES sales.stores (store_id)
);
```
## Grouping Sets 
When you need to have combined answer of multiple Group by statement..

You could also use union all clause here.. but that needs to have same number of coulmns in each select statement..BAD IDEA 

[Know more here](https://sqlskull.com/2020/01/21/sql-server-grouping-sets/)

## cube 
Have all combination of Grouping Sets 
```
SELECT
    d1,
    d2,
    d3,
    aggregate_function (c4)
FROM
    table_name
GROUP BY
    GROUPING SETS (
        (d1,d2,d3), 
        (d1,d2),
        (d1,d3),
        (d2,d3),
        (d1),
        (d2),
        (d3), 
        ()
     );
```

After using Cube -- 

```
SELECT
    d1,
    d2,
    d3,
    aggregate_function (c4)
FROM
    table_name
GROUP BY
    CUBE (d1, d2, d3);          
```

A schema is a collection of database objects including tables, views, triggers, stored procedures, indexes, etc. A schema is associated with a username which is known as the schema owner, who is the owner of the logically related database objects.

A schema always belongs to one database. On the other hand, a database may have one or multiple schemas

## Joins 

### Inner Join :

`Helps to find common values`
![](https://www.sqlservertutorial.net/wp-content/uploads/SQL-Server-Joins-Inner-Join-1.png)

If table1 and Table 2 have same column (i.e somehow linked together) then inner join helps us to display the `matching pattern columns`

![](https://www.sqlservertutorial.net/wp-content/uploads/SQL-Server-INNER-JOIN.png)

```sql
SELECT
    select_list
FROM
    T1
INNER JOIN T2 ON join_condition;
```

### left join 
Also knowm as left outer join. Displays `null` for values that appear in left table but are missing in right table

![](https://www.sqlservertutorial.net/wp-content/uploads/SQL-Server-Joins-Left-Join-diagram.png)

### right join
![](https://www.sqlservertutorial.net/wp-content/uploads/SQL-Server-Joins-Right-Join-Diagram.png)

### full join 
Union of both tables with **Null** in missing values 

## Subquery
`Ms docs says` --

A subquery is a query that is nested inside a SELECT, INSERT, UPDATE, or DELETE statement, or inside another subquery.

```sql
-- Common Subquery Patterns 
WHERE expression \[NOT] IN (subquery)
WHERE expression comparison_operator \[ANY | ALL] (subquery)
WHERE \[NOT] EXISTS (subquery)
```

**Correlated Subquery**
In queries that include a correlated subquery (also known as a repeating subquery), the subquery depends on the outer query for its values.

```sql
Where 
In 
= 
```

## Extra Reading 
[Query Procedure](https://docs.microsoft.com/en-us/sql/relational-databases/query-processing-architecture-guide?view=sql-server-ver15)
