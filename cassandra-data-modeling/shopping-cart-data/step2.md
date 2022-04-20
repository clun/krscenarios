Create table `carts_by_user`:
```sql
CREATE TABLE carts_by_user (
  user_id TEXT,
  cart_name TEXT,
  cart_id UUID,
  cart_is_active BOOLEAN,
  user_email TEXT STATIC,
  PRIMARY KEY ((user_id),cart_name,cart_id)
);
```{{execute}}

Create table `items_by_id`:
```sql
CREATE TABLE items_by_id (
  id TEXT,
  name TEXT,
  description TEXT,
  price DECIMAL,
  PRIMARY KEY ((id))
);
```{{execute}}

Create materialized view `items_by_name`:
```sql
CREATE MATERIALIZED VIEW items_by_name 
  AS 
    SELECT * FROM items_by_id
    WHERE name IS NOT NULL 
      AND id IS NOT NULL
  PRIMARY KEY ((name), id);
```{{execute}}


Create table `items_by_cart`:
```sql
CREATE TABLE items_by_cart (
  cart_id UUID,
  timestamp TIMESTAMP,
  item_id TEXT,
  item_name TEXT,
  item_description TEXT,
  item_price DECIMAL,
  quantity INT,
  cart_subtotal DECIMAL STATIC,
  PRIMARY KEY ((cart_id),timestamp,item_id)
) WITH CLUSTERING ORDER BY (timestamp DESC, item_id ASC);
```{{execute}}