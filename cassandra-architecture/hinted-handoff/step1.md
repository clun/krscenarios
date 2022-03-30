We've started a three node Cassandra cluster for you...

Now load the schema...
TODO add the schema file

Determine which nodes are responsible for the `cassandra` partition in the `videos_by_tag` table by executing the following command in the terminal:

`nodetool getendpoints killrvideo videos_by_tag 'cassandra'`{{execute}}

Bring down both of those nodes. Wait for them to terminate before continuing. You'll execute two commands like the following, replacing `<node>` with the actual name of the node.

`ccm <node> nodetool stopdaemon`

You can determine that the nodes are down by using the nodetool status command on the remaining node. You'll type something like the following, replacing `<node>` with the actual name of the node. 

`ccm <node> nodetool status`

Repeat this until the two nodes you've stopped show a `down` state.

