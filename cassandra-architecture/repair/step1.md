We've already started a three node cluster for you and loaded some data into the `videos_by_tag` table.

TODO load the schema in the background

We are going to bring down one of the nodes responsible for the `cassandra` tag. As a review, the following command will tell you what nodes these are:

`ccm node1 nodetool getendpoints killrvideo videos_by_tag 'cassandra'`{{execute}}

Be sure you make note of which nodes these are.

Choose one of the nodes to bring down. Before bringing the node down, flush its data by executing the following command:

`ccm node1 nodetool drain`{{execute}}

Now bring down your chosen node responsible for the cassandra replica. 

`ccm node1 nodetool stopdaemon`{{execute}}

Wait for the node to terminate before continuing.

`ccm node2 nodetool status`{{execute}}

Keep track of which node you brought down.

In the data folder of the downed node, find the directory that contains the table data for `videos_by_tag`. 

`cd node2/data/data/killrvideo
ls -l`{{execute}} 

Delete the entire directory.

`rm -rf videos_by_tag-*`{{execute}}
