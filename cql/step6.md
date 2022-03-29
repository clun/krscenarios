Add the row into our table using the CQL `INSERT` statement:
```
INSERT INTO users (email, name, age, date_joined) 
VALUES ('joe@datastax.com', 'Joe', 25, '2020-01-01');
```{{execute}}

Insert another row into the table:
<details>
  <summary>Solution</summary> 
```
INSERT INTO users (email, name, age, date_joined) 
VALUES ('jen@datastax.com', 'Jen', 27, '2020-01-01');
```{{execute}}
</details>