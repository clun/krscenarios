Bring up the other downed node. 

Wait for it to come online. 


Keep track of which node this is as we will take it down again shortly after triggering a read repair. Remember that this node you are bringing up still has all our data for the cassandra partition.

Start `cqlsh`, set your consistency level to `TWO`.

`CONSISTENCY TWO;`{{execute}}

A consistency level of `TWO` will cause Cassandra to read both replicas, perform the checksum diff, and notice the data is not in sync between the two nodes. Cassandra will then invoke a read repair to repair the node from which we deleted the data.

Execute the following query:

`SELECT *
FROM killrvideo.videos_by_tag
WHERE tag = 'cassandra';`{{execute}}

The query succeeds!
