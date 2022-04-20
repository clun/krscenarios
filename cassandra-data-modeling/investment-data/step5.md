Find all positions in account `joe001`; order by instrument symbol (asc):

<details>
  <summary>Solution</summary>

```sql
SELECT * 
FROM positions_by_account
WHERE account = 'joe001'; 
```{{execute}}

</details>
