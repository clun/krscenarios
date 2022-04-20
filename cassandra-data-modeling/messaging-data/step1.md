Create the `messaging_data` keyspace:
```sql
CREATE KEYSPACE messaging_data
WITH replication = {
  'class': 'NetworkTopologyStrategy', 
  'DC-Houston': 1 };
```{{execute}}

Set the current working keyspace:
```sql
USE messaging_data;
```{{execute}}
