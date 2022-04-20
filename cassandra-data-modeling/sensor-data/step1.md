Create the `sensor_data` keyspace:
```sql
CREATE KEYSPACE sensor_data
WITH replication = {
  'class': 'NetworkTopologyStrategy', 
  'DC-Houston': 1 };
```{{execute}}

Set the current working keyspace:
```sql
USE sensor_data;
```{{execute}}
