Find ids, subjects, senders, read/unread statuses and timestamps of all emails with label `inbox` for user `joe@datastax.com`; order by timestamp (desc):

<details>
  <summary>Solution</summary>

```sql
SELECT id, subject, "from", is_read, 
       toTimestamp(id) AS timestamp
FROM emails_by_user_folder
WHERE label = 'inbox' 
  AND username = 'joe@datastax.com'; 
```{{execute}}

</details>
