CQL queries look just like SQL queries. However, while you will see familiar clauses `SELECT`, `FROM`, `WHERE`, `GROUP BY` 
and `ORDER BY`, CQL queries are much more restrictive in what goes into those clauses. 

A CQL query can only retrieve data from a single table, so there are no joins, self-joins, nested queries, unions, intersections and so forth. 
Moreover, only columns that are declared in table's `PRIMARY KEY` definition can be used to filter, group or order rows. 
The *primary key definition order* must be respected when filtering and grouping, such that a complete partition key must be used and 
when a clustering key column is used, any preceding clustering column in the primary key definition must also be used. 
When ordering rows, the *clustering order* declared in the table definition must be respected. Ordering only applies to rows within a partition and
can be either preserved or reversed.

These restrictions ensure that your queries only use efficient data access patterns, which include *retrieving one row*, 
*retrieving all rows or a subset of rows from one partition* and *retrieving rows from at most a few partitions*. 
The smaller the number of partitions a query touches, the better performance and throughput can be expected. When studying 
our query examples in this tutorial, pay attention to data access patterns they implement.

