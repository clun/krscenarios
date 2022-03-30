Cassandra has a more detailed type of logging known as tracing. You use tracing to evaluate the performance of specific queries. While analyzing traces is a bit beyond our scope here, let's see what you can learn about Cassandra's tracing settings from `nodetool`:

`nodetool gettraceprobability`{{execute}}

As you can see, the trace probability is set to zero, the default value. This means that this node will not record trace data for any queries it receives unless specifically requested by the client.

Now, set the trace probability to 10% using this command:
  
`nodetool settraceprobability 0.1`{{execute}}

This means that from this point forward, this node will store trace data for one out of every 10 queries it receives. The saved trace data can then be viewed in the `system_traces` keyspace.

For example, you can view trace data using `cqlsh` with a command such as this:

`cqlsh -e "SELECT * FROM system_traces.events LIMIT 10"`{{execute}}

This command gives a sampling of the contents of this table.