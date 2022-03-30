Terminate your second node by executing:

/home/ubuntu/node2/resources/cassandra/bin/nodetool stopdaemon

Check the gossipinfo on node1. Notice node2's gossip information is still present as it is part of the cluster, but its STATUS state is shutdown.

Restart your second node.

Rerun nodetool gossipinfo on either node, and notice the generation values are the same as before for node1, but are now different for node2 since we restarted node2.

