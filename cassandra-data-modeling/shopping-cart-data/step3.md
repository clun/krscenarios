Execute the CQL script to insert sample data:
```
SOURCE '~/shopping_cart_data.cql'
```{{execute}}

Retrieve all rows from table `carts_by_user`:
```
SELECT user_id, cart_name, 
       cart_id, cart_is_active
FROM carts_by_user;        
```{{execute}}

Retrieve all rows from table `items_by_id`:
```
SELECT * FROM items_by_id;
```{{execute}}

Retrieve all rows from materialized view `items_by_name`:
```   
SELECT * FROM items_by_name;                    
```{{execute}}

Retrieve all rows from table `items_by_cart`:
```
SELECT cart_id, timestamp, item_id 
FROM items_by_cart; 

SELECT cart_id, item_id, item_price, 
       quantity, cart_subtotal 
FROM items_by_cart; 
```{{execute}}
