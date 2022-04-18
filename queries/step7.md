Table `ratings_by_movie` stores information about ratings organized by movies, 
such that each partition contains all ratings for one particular movie. 
This table has multi-row partitions and 
the primary key defined as `PRIMARY KEY ((title, year), email)`. 
Let's first retrieve all rows from the table to learn how the data looks like and then focus 
on predicates that the primary key can support.

Q1. Retrieve all rows:
<details>
  <summary>Solution</summary>

```
SELECT * FROM ratings_by_movie;
```{{execute}}

</details>

<br/>

Q2. Retrieve one partition:
<details>
  <summary>Solution</summary>

```
SELECT * FROM ratings_by_movie
WHERE title = 'Alice in Wonderland'
  AND year  = 2010;
```{{execute}}

</details>

<br/>

Q3. Retrieve two partitions:
<details>
  <summary>Solution</summary>

```
SELECT * FROM ratings_by_movie
WHERE title = 'Alice in Wonderland'
  AND year IN (2010, 1951);
```{{execute}}

</details>

<br/>

Q4. Retrieve one row:
<details>
  <summary>Solution</summary>

```
SELECT * FROM ratings_by_movie
WHERE title = 'Alice in Wonderland'
  AND year  = 2010
  AND email = 'joe@datastax.com';
```{{execute}}

</details>

<br/>

Q5 - Q6. Retrieve a subset of rows from a partition:
<details>
  <summary>Solution 1</summary>

```
SELECT * FROM ratings_by_movie
WHERE title = 'Alice in Wonderland'
  AND year  = 2010
  AND email IN ('jen@datastax.com', 
                'jim@datastax.com');
```{{execute}}

</details>
<details>
  <summary>Solution 2</summary>

```
SELECT * FROM ratings_by_movie
WHERE title = 'Alice in Wonderland'
  AND year  = 2010
  AND email < 'job@datastax.com';
```{{execute}}

</details>