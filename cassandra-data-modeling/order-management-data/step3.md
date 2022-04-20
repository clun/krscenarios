Execute the CQL script to insert sample data:
```sql
SOURCE '~/order_management_data.cql'
```{{execute}}

Retrieve all rows from table `orders_by_user`:
```sql
SELECT * FROM orders_by_user;        
```{{execute}}

Retrieve all rows from table `orders_by_id`:
```sql
EXPAND ON;

SELECT 
  order_id,
  item_name,
  item_id,
  item_description,
  item_price,
  item_quantity,
  order_status,
  order_timestamp,
  order_subtotal,
  order_shipping,
  order_tax,
  order_total,
  payment_summary,
  payment_details,
  billing_summary,
  billing_details,
  shipping_summary,
  shipping_details,
  delivery_id,
  delivery_details 
FROM orders_by_id;

EXPAND OFF;
```{{execute}}

Retrieve all rows from table `orders_by_user_item`:
```sql
SELECT * FROM orders_by_user_item;                    
```{{execute}}

Retrieve all rows from table `order_status_history_by_id`:
```sql
SELECT * FROM order_status_history_by_id; 
```{{execute}}
