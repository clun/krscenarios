Cassandra does not sort rows when executing queries. Instead, a query either preserves the clustering order or reverses it
when retrieving rows from a table. Even when `ORDER BY` is not used, a query result still preserves the clustering order.
Also, remember that the clustering order applies to rows within the same partition and does not apply to rows that belong 
to different partitions.

For table `ratings_by_user` with `CLUSTERING ORDER BY (title ASC, year DESC)`, there are only two ordering options as shown below.

Q1. Use the clustering order:
```
SELECT * FROM ratings_by_user
WHERE email = 'jim@datastax.com'
ORDER BY title ASC, year DESC;

-- ORDER BY can be omitted 
SELECT * FROM ratings_by_user
WHERE email = 'jim@datastax.com';
```{{execute}}

Q2. Use the reverse clustering order:
```
SELECT * FROM ratings_by_user
WHERE email = 'jim@datastax.com'
ORDER BY title DESC, year ASC;
```{{execute}}