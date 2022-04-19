Find a status history for order `111-0461064-1669732`; sort by status timestamp (desc):

<details>
  <summary>Solution</summary>
```
SELECT * 
FROM order_status_history_by_id
WHERE order_id = '111-0461064-1669732'; 
```{{execute}}
</details>

