Create the `investment_data` keyspace:
```
CREATE KEYSPACE investment_data
WITH replication = {
  'class': 'NetworkTopologyStrategy', 
  'DC-Houston': 1 };
```{{execute}}

Set the current working keyspace:
```
USE investment_data;
```{{execute}}
