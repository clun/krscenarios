We've already started a single Cassandra node for you. Let's examine the contents of the `commitlog` directory for this node:

`ls -lh /usr/share/cassandra/data/commit-log`{{execute}}

Let's put a watch on this directory to see how it changes as we write data to Cassandra. 

`watch -n 1 -d "ls -lh /usr/share/cassandra/data/commit-log"`{{execute}}

NOTE: To exit the watch later, we'll use CTRL-C




