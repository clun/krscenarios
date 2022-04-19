Find id and name of an active shopping cart that belongs to user `jen`:
 
<details>
  <summary>Solution 1 (preferred)</summary>
```
-- Retrieve all carts for jen
-- and scan the result set
-- within an application
-- to find an active cart.
SELECT user_id, cart_name, 
       cart_id, cart_is_active
FROM carts_by_user
WHERE user_id = 'jen';
```{{execute}}
</details>

<details>
  <summary>Solution 2</summary>
```
-- Retrieve all carts for jen
-- and scan the result set
-- within Cassandra
-- to find an active cart.
-- Note that this is a rare case of
-- scanning within a small partition
-- when ALLOW FILTERING 
-- might be acceptable. 
SELECT user_id, cart_name, 
       cart_id, cart_is_active
FROM carts_by_user
WHERE user_id = 'jen'
  AND cart_is_active = true 
ALLOW FILTERING;
```{{execute}}
</details>