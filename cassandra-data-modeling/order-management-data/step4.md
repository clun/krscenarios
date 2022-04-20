Find all orders placed by user `joe` between dates `2020-01-01` and `2020-12-31`, inclusive; sort by order timestamp (desc):
 
<details>
  <summary>Solution</summary>

```sql
SELECT * 
FROM orders_by_user 
WHERE user_id = 'joe'
  AND order_timestamp >= '2020-01-01'
  AND order_timestamp <  '2021-01-01';
```{{execute}}

</details>
