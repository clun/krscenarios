In your terminal, start the first node via TODO

Wait for the node to start up. Once it has done so, press enter to get back to the prompt. TODO probably not necessary

Run the `nodetool status` command to verify the node is working properly.

The UN indicates UP NORMAL meaning the node is ready to go. Load indicates current disk space usage. Owns indicates how many tokens this node is responsible for (it is the only node in the ring at the moment). Token should be 0 (the same value set in the cassandra.yaml file). We discuss racks later in the series.
