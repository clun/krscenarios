Now start `cqlsh` on the remaining node:

`ccm <node> cqlsh`

Once started, you can switch to the `killrvideo` keyspace:

`USE killrvideo;`{{execute}}

Now, change the consistency level to `ANY`:

`CONSISTENCY ANY;`{{execute}}

NOTE: When a client writes with consistency level `ANY`, storing a hint is sufficient for the write to be successful. Consistency level `ONE` requires that at least one successful node write - a hint is not sufficient.

Execute the following `INSERT` command:

`INSERT INTO videos_by_tag(tag, added_date, video_id, title)
VALUES ('cassandra', '2016-2-11', uuid(), 'Cassandra, Take Me Home');`{{execute}}

The write will succeed even though both replica nodes are down. The one and only node left in the cluster stores the writes as hints for the two replica nodes until they come back online.

Now let's exit `cqlsh`:

`exit`{{execute}}

