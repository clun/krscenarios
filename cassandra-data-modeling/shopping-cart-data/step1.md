Create the `shopping_cart_data` keyspace:
```
CREATE KEYSPACE shopping_cart_data
WITH replication = {
  'class': 'NetworkTopologyStrategy', 
  'DC-Houston': 1 };
```{{execute}}

Set the current working keyspace:
```
USE shopping_cart_data;
```{{execute}}
