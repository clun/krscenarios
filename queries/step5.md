Table `movies` stores information about movies, which are uniquely identified by their titles and release years.
This table has single-row partitions and 
the primary key defined as `PRIMARY KEY ((title, year))`. 
Let's first retrieve all rows from the table to learn how the data looks like and then focus 
on predicates that the primary key can support.

Q1. Retrieve all rows:
<details>
  <summary>Solution</summary>

```
SELECT * FROM movies;
```{{execute}}

</details>

<br/>

Q2. Retrieve one row/partition:
<details>
  <summary>Solution</summary>

```
SELECT * FROM movies
WHERE title = 'Alice in Wonderland'
  AND year = 2010;
```{{execute}}

</details>

<br/>

Q3. Retrieve two rows/partitions:
<details>
  <summary>Solution</summary>

```
SELECT * FROM movies
WHERE title = 'Alice in Wonderland'
  AND year IN (2010, 1951);
```{{execute}}

</details>  


