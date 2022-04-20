Create the `time_series` keyspace:
```sql
cqlsh -e "

CREATE KEYSPACE time_series
WITH replication = {
  'class': 'NetworkTopologyStrategy', 
  'DC-Houston': 1 };"
```{{execute}}

