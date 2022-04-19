Save an active shopping cart with name `My Birthday` and id `4e66baf8-f3ad-4c3b-9151-52be4574f2de`, 
and designate a different cart with name `Gifts for Mom` and id `19925cc1-4f8b-4a44-b893-2a49a8434fc8` to be a new active shopping cart for user `jen`:

<details>
  <summary>Solution</summary>
```
BEGIN BATCH
  UPDATE carts_by_user 
  SET cart_is_active = false
  WHERE user_id = 'jen'
    AND cart_name = 'My Birthday'
    AND cart_id = 4e66baf8-f3ad-4c3b-9151-52be4574f2de
  IF cart_is_active = true;
  UPDATE carts_by_user 
  SET cart_is_active = true
  WHERE user_id = 'jen'
    AND cart_name = 'Gifts for Mom'
    AND cart_id = 19925cc1-4f8b-4a44-b893-2a49a8434fc8;
APPLY BATCH;

SELECT user_id, cart_name, 
       cart_id, cart_is_active
FROM carts_by_user
WHERE user_id = 'jen';
```{{execute}}
</details>


