Since there are only two nodes, you would expect that the number of bytes sent from one node should be equal to the number of bytes received by the other node.
Let's see if we can demonstrate that.

We have prepared two files containing the CQL queries for these tables.
We will run these queries on separate nodes nearly simultaneously and look at the results.

Take a look at the inbound query.

```
cat in.cql
```{{execute}}

You see we are only looking at two fields: the number of operations and the number of bytes.
Isolating these metrics makes it a little easier to compare the results across nodes.


Here's the outbound query

```
cat out.cql
```{{execute}}

Here's the command to execute both of these queries on separate nodes nearly simultaneously.

```
cqlsh node1 -f in.cql; cqlsh node2 -f out.cql
```{{execute}}

Often, the number of bytes written will exceed the number of bytes read.
You can make sense of this by considering the number of operations.
You see that the number of write operations often exceeds the number of read operations (until the read node catches up).

Re-run the queries (by clicking above) until the number of operations is the same for both nodes.
You see that the number of bytes transferred also matches.
