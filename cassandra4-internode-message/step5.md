One visible aspect of the Cassandra 4.X internode messaging improvements is that internode messaging metrics are now available as virtual tables.
In this step, we'll show you what we mean.

Each node in the Cassandra cluster has virtual tables in which Cassandra keeps internode messaging metrics.
One table, <code>internode_inbound</code>, keeps track of inbound messaging metrics, and <code>internode_outbound</code> keeps track of the outbound metrics.
Both tables are in the <code>system_views</code> keyspace.

Note that these are not real tables.
They merely _appear_ as tables to allow access to the metrics they contain.

We'll use _CQLSH_ to look at these tables.

```
cqlsh node1
```{{execute}}

In _CQLSH_, the following command shows what the inbound table looks like.

```
DESCRIBE TABLE system_views.internode_inbound;
```{{execute}}

Here's the outbound table.

```
DESCRIBE TABLE system_views.internode_outbound;
```{{execute}}

Notice that these descriptions are embedded within comments.
This is because the tables are virtual and were never actually created.

Exit _CQLSH_ using the following command.

```
QUIT
```{{execute}}
