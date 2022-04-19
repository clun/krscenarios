Cancel order `113-3827060-8722206` placed by user `joe` on `2020-11-17` at `22:20:43` by updating its status from `pending` to `canceled`:

<details>
  <summary>Solution</summary>

<p>Step 1. Update the "source-of-truth" table using a light weight transaction:</p>

```
UPDATE orders_by_id 
SET order_status = 'canceled' 
WHERE order_id = '113-3827060-8722206'
IF order_status = 'pending';
```{{execute}}


<p>Step 2. Update the other tables if and only if the previous transaction was successfully applied:</p>

```
UPDATE orders_by_user 
SET order_status = 'canceled' 
WHERE order_id = '113-3827060-8722206'
  AND user_id = 'joe'
  AND order_timestamp = '2020-11-17 22:20:43';
  
INSERT INTO order_status_history_by_id (order_id, status_timestamp, order_status)
VALUES ('113-3827060-8722206',TOTIMESTAMP(NOW()),'canceled');
```{{execute}}

<p>Step 3. Optionally, verify the changes:</p>

```
SELECT order_status
FROM orders_by_id 
WHERE order_id = '113-3827060-8722206';

SELECT order_status
FROM orders_by_user 
WHERE order_id = '113-3827060-8722206'
  AND user_id = 'joe'
  AND order_timestamp = '2020-11-17 22:20:43';
  
SELECT order_status 
FROM order_status_history_by_id
WHERE order_id = '113-3827060-8722206'
LIMIT 1;
```{{execute}}

</details>


