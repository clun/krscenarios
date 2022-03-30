We've already started up a three-node Cassandra cluster for you.

Let's ensure that all three nodes are up

`nodetool status`{{execute}}

Then start cqlsh:

`cqlsh`{{execute}}

(load schema and data)

Now check the current consistency level by executing the CONSISTENCY command as we have it written out for you here:

CONSISTENCY;

Notice that consistency is ONE; meaning only one node must acknowledge a write on a write request, and only one node must return a result set to satisfy a read request.

Set your consistency level to TWO by executing the following command:

CONSISTENCY TWO;

NOTE: In this case, TWO is the same as ALL because our current replication settings store one replica per data center, and we have two data centers.

Retrieve the cassandra partition from the videos_by_tag table by executing the following command:

SELECT *
FROM videos_by_tag
WHERE tag = 'cassandra';

The query succeeds.
