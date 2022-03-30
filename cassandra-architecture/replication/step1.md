In your terminal, extract the tarball again to make a third node by executing the following commands (be sure you are in the /home/ubuntu/ directory).

tar -xf dse-6.y.0-bin.tar.gz
mv dse-6.7.0 node3
labwork/config_node 3

Ensure that both of your previous two nodes are up. We need to configure this new third node to play nicely with these other nodes already running on your machine.

Edit /home/ubuntu/node3/resources/cassandra/conf/cassandra.yaml. Change num_tokens to 128 and comment out initial_token.

Change the endpoint_snitch to GossipingPropertyFileSnitch. Save your changes and exit the editor.

Now, edit /home/ubuntu/node3/resources/cassandra/conf/cassandra-rackdc.properties. Change the dc to west-side and the rack to hakuna-matata. Save and close the file.

Start your third node by executing /home/ubuntu/node3/bin/dse cassandra

Once the node is up, ensure all three nodes are in your cluster by executing /home/ubuntu/node1/bin/dsetool status. (You can use any node's dsetool to do this if you like.)
