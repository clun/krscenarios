Create the `investment_data` keyspace:
```sql
CREATE KEYSPACE investment_data
WITH replication = {
  'class': 'NetworkTopologyStrategy', 
  'DC-Houston': 1 };
```{{execute}}

Set the current working keyspace:
```sql
USE investment_data;
```{{execute}}
