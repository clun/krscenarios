Create the `sensor_data` keyspace:
```
CREATE KEYSPACE sensor_data
WITH replication = {
  'class': 'NetworkTopologyStrategy', 
  'DC-Houston': 1 };
```{{execute}}

Set the current working keyspace:
```
USE sensor_data;
```{{execute}}
