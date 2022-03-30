
Let's determine which nodes our replicas ended up on. Execute the following commands in the terminal:

`nodetool getendpoints killrvideo videos_by_tag 'cassandra'`{{execute}}

`nodetool getendpoints killrvideo videos_by_tag 'datastax'`{{execute}}

Examime the output and note how `nodetool` displays the IP addresses of the nodes containing our data.

Notice Cassandra stores each replica twice, and each replica is in a different data center. Your results may vary due to randomness in choosing tokens for vnodes.

Cassandra doesn't have to have an actual partition with a key value to determine which nodes will store that partition. You can try any partition key value you like. For example, try the following:

`nodetool getendpoints killrvideo videos_by_tag 'action'`{{execute}}

`nodetool getendpoints killrvideo videos_by_tag 'horror'`{{execute}}
