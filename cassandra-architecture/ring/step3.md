Start the second node
 
via /home/ubuntu/node2/bin/dse cassandra command. 
 
This node will take longer to bootstrap and join the cluster.

Wait for the second node to finish bootstrapping such that both nodes are up and normal before continuing.

`nodetool status`{{execute}}
