Determine which nodes hold the replicas for the `cassandra` partition tag value in the `videos_by_tag` table by executing the following command at the terminal prompt:

`nodetool getendpoints killrvideo videos_by_tag 'cassandra'`{{execute}}

Bring one of the nodes down by executing:

`nodetool stopdaemon`{{execute}}

TODO fix this to be variable?

where X is the node number. In choosing your nodes, pick the one that has another node with it in a rack. Track which node it is that you brought down and also the node number that is still up.

