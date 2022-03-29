Finally, delete the row using the CQL `DELETE` statement:
```
DELETE FROM users 
WHERE email = 'joe@datastax.com';

SELECT * FROM users;
```{{execute}}

Deleting another row from the table:
<details>
  <summary>Solution</summary> 
```
DELETE FROM users 
WHERE email = 'jen@datastax.com';

SELECT * FROM users;
```{{execute}}
</details>