Create the `shopping_cart_data` keyspace:
```sql
CREATE KEYSPACE shopping_cart_data
WITH replication = {
  'class': 'NetworkTopologyStrategy', 
  'DC-Houston': 1 };
```{{execute}}

Set the current working keyspace:
```sql
USE shopping_cart_data;
```{{execute}}
