Start `cqlsh` on one of your up and running nodes. 

`cqlsh`{{execute}}

Switch to the `killrvideo` keyspace, and  ensure that your consistency level is set to ONE.

`USE killrvideo;
CONSISTENCY ONE;`{{execute}}

Execute the following query. What results do you expect back?

`SELECT *
FROM killrvideo.videos_by_tag
WHERE tag = 'cassandra';`{{execute}}

We get all the data back because the replica node for the cassandra partition is up and still has the data. The query did not fail because our consistency level is `ONE`.

