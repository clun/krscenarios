Find ids and names of all shopping carts that belong to user `jen`; order by cart name (asc):
 
<details>
  <summary>Solution</summary>
```
SELECT user_id, cart_name, 
       cart_id, cart_is_active
FROM carts_by_user
WHERE user_id = 'jen';
```{{execute}}
</details>
