You can further prove which partition resides on which node by executing the following nodetool commands in the terminal:

`nodetool getendpoints killrvideo videos_by_tag 'cassandra'`{{execute}}

`nodetool getendpoints killrvideo videos_by_tag 'datastax'`{{execute}}

The `getendpoints` command returns the IP addresses of the node(s) which store the partitions with the respective partition key value (the last argument in single quotes: `cassandra` and `datastax` respectively). Notice we must also supply the keyspace and table name we are interested in since, we set replication on a per-keyspace basis. There is more on replication to come later in this series.