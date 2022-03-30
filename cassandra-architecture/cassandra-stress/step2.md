Try:

./nodetool drain

The drain command stops writes from occurring on the node and flushes all data to disk. Typically, this command may be run before stopping a Cassandra node.