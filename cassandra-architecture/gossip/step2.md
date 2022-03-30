Execute the following command:

`nodetool gossipinfo`{{execute}}

Note the gossip information for both nodes as discussed in the slides.

Notice that even though we executed this command on `node1`, `node1` still knows `node2`'s gossip state. Also notice the node state consists of key-values pairs as discussed in the slides.

Rerun the `nodetool gossipinfo` command above a few more times and notice the heartbeat values increasing for both nodes.

Run `nodetool gossipinfo` on `node2` instead of node1. 

`ssh root@node2 "nodetool gossipinfo"`{{execute}}

Notice the gossip data is the same.