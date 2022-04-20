Find all folder labels and colors for user `joe@datastax.com`:

<details>
  <summary>Solution</summary>

```sql
SELECT label, color 
FROM folders_by_user
WHERE username = 'joe@datastax.com';   
```{{execute}}

</details>

<br/>

Find all folder labels and unread email quantities for user `joe@datastax.com`:

<details>
  <summary>Solution</summary>

```sql
SELECT label, num_unread 
FROM unread_email_stats
WHERE username = 'joe@datastax.com'; 
```{{execute}}

</details>