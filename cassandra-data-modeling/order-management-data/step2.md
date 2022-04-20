Create table `orders_by_user`:
```sql
CREATE TABLE orders_by_user (
  user_id TEXT,
  order_timestamp TIMESTAMP,
  order_id TEXT,
  order_status TEXT,
  order_total DECIMAL,
  PRIMARY KEY ((user_id),order_timestamp,order_id)
) WITH CLUSTERING ORDER BY (order_timestamp DESC, order_id ASC);
```{{execute}}

Create table `orders_by_id`:
```
CREATE TABLE orders_by_id (
  order_id TEXT,
  item_name TEXT,
  item_id TEXT,
  item_description TEXT,
  item_price DECIMAL,
  item_quantity INT,
  order_status TEXT STATIC,
  order_timestamp TIMESTAMP STATIC,
  order_subtotal DECIMAL STATIC,
  order_shipping DECIMAL STATIC,
  order_tax DECIMAL STATIC,
  order_total DECIMAL STATIC,
  payment_summary TEXT STATIC,
  payment_details MAP<TEXT,TEXT> STATIC,
  billing_summary TEXT STATIC,
  billing_details MAP<TEXT,TEXT> STATIC,
  shipping_summary TEXT STATIC,
  shipping_details MAP<TEXT,TEXT> STATIC,
  delivery_id TEXT STATIC,
  delivery_details MAP<TEXT,TEXT> STATIC,
  PRIMARY KEY ((order_id),item_name,item_id)
);
```{{execute}}

Create table `orders_by_user_item`:
```
CREATE TABLE orders_by_user_item (
  user_id TEXT,
  item_id TEXT,
  order_timestamp TIMESTAMP,
  order_id TEXT,
  PRIMARY KEY ((user_id,item_id),order_timestamp,order_id)
) WITH CLUSTERING ORDER BY (order_timestamp DESC, order_id ASC);
```{{execute}}


Create table `order_status_history_by_id`:
```
CREATE TABLE order_status_history_by_id (
  order_id TEXT,
  status_timestamp TIMESTAMP,
  order_status TEXT,
  PRIMARY KEY ((order_id),status_timestamp)
) WITH CLUSTERING ORDER BY (status_timestamp DESC);
```{{execute}}


