Add item `Box2` into active cart `19925cc1-4f8b-4a44-b893-2a49a8434fc8` and update the cart subtotal to `111.50`:

<details>
  <summary>Solution</summary>
```
BEGIN BATCH
  INSERT INTO items_by_cart (
    cart_id,
    timestamp,
    item_id,
    item_name,
    item_description,
    item_price,
    quantity)
  VALUES (
    19925cc1-4f8b-4a44-b893-2a49a8434fc8,
    TOTIMESTAMP(NOW()),
    'Box2',
    'Chocolates',
    '25 gourmet chocolates from our collection',
    60.00,
    1);
  UPDATE items_by_cart 
  SET cart_subtotal = 111.50
  WHERE cart_id = 19925cc1-4f8b-4a44-b893-2a49a8434fc8
  IF cart_subtotal = 51.50;
APPLY BATCH;

SELECT timestamp, item_id, item_price, 
       quantity, cart_subtotal 
FROM items_by_cart
WHERE cart_id = 19925cc1-4f8b-4a44-b893-2a49a8434fc8; 
```{{execute}}
</details>


