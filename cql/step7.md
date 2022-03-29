Now, retrieve the row using the CQL `SELECT` statement:
```
SELECT * FROM users
WHERE email = 'joe@datastax.com';
```{{execute}}

Retrieve a different row from the table:
<details>
  <summary>Solution</summary> 
```
SELECT * FROM users
WHERE email = 'jen@datastax.com';
```{{execute}}
</details>

