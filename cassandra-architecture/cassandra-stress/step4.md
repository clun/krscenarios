Navigate back to /home/ubuntu/node/resources/cassandra/bin and run:

./nodetool flush

The flush command commits all written (memtable, discussed later) data to disk. Unlike drain, flush allows further writes to occur.