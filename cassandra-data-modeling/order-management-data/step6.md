Find all orders that contain item `n-0023` and are placed by user `joe`; sort by order timestamp (desc):

<details>
  <summary>Solution</summary>
```
SELECT * 
FROM orders_by_user_item
WHERE item_id = 'n-0023'
  AND user_id = 'joe';  
```{{execute}}
</details>


