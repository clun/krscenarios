Next, update the row using the CQL `UPDATE` statement:
```
UPDATE users SET name = 'Joseph' 
WHERE email = 'joe@datastax.com';

SELECT * FROM users;
```{{execute}}

Update another row in the table:
<details>
  <summary>Solution</summary> 
```
UPDATE users SET name = 'Jennifer' 
WHERE email = 'jen@datastax.com';

SELECT * FROM users;
```{{execute}}
</details>