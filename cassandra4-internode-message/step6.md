Let's use _CQLSH_ to query the virtual tables.

Notice that each Cassandra node has two local tables.
Let's look at the tables in the second node.

```
cqlsh node2
```{{execute}}

Here's the query to see the tables' contents.

```
SELECT * FROM system_views.internode_inbound;
SELECT * FROM system_views.internode_outbound;
```{{execute}}

Let's switch and look at the contents of the tables in the first node.

```
QUIT
cqlsh node1
```{{execute}}

Now, query the first nodes' tables.
```
SELECT * FROM system_views.internode_inbound;
SELECT * FROM system_views.internode_outbound;
```{{execute}}

Notice that the tables in the first node show the DC-East datacenter, whereas the tables in the second node showed the DC-West datacenter.

Exit _CQLSH_.

```
QUIT
```{{execute}}
