Create the `time_series` keyspace:
```
cqlsh -e "

CREATE KEYSPACE time_series
WITH replication = {
  'class': 'NetworkTopologyStrategy', 
  'DC-Houston': 1 };"
```{{execute}}

