# Hacker rank 

- [The report]

```sql
/*
REQUIREMENTS
1. Display no students with grades less than 8 Order by DESC grade

2. Many students same grade then order by Name

3.  For 1-7 grade display I. DESC
*/

-- for 1 
select s.name, g.grade 
From student s, grade g
where s.marks between g.min_marks and g.max_marks
and ((g.min_marks between 70 and 90) and (g.max_marks between 79 and 100))
Order by g.grade DESC

```

[The blunder](https://www.hackerrank.com/challenges/the-blunder/problem)


[The challenge](https://www.hackerrank.com/challenges/full-score/problem)
```sql
/*
REQUIREMENTS 
1 . dispaly Hacker Id + Names who got full marks in more than 1 challenge
2. Order them by total number of challenge taken DESC

If same no. Of challenge won - ASC hackerid
*/

```


#### group sets

```sql
SELECT
    GROUPING(brand) grouping_brand,
    GROUPING(category) grouping_category,
    brand,
    category,
    SUM (sales) sales
FROM
    sales.sales_summary
GROUP BY
    GROUPING SETS (
        (brand, category),
        (brand),
        (category),
        ()
    )
ORDER BY
    brand,
    category;
```
