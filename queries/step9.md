Some queries may need to organize rows into groups 
and compute aggregates for each individual group. In Cassandra, 
grouping is always based on partition and clustering key columns and
must follow the primary key definition order. In other words, a group 
is always defined as a set of rows belonging to the same partition.
Consider the following query examples.

Q1. Calculate average ratings for all movies:
```
SELECT   title, year,
         AVG(CAST(rating AS FLOAT)) AS avg_rating
FROM     ratings_by_movie
GROUP BY title, year;
```{{execute}}

Q2. Calculate the number of ratings per user:
<details>
  <summary>Solution</summary>

```
SELECT   email, COUNT(rating) AS n
FROM     ratings_by_user
GROUP BY email;
```{{execute}}

</details> 