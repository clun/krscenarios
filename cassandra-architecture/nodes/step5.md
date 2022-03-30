Now that you looked at several of the things you can learn about a Cassandra node using `nodetool`, let's practice doing an orderly shutdown, which you can do using additional `nodetool` commands. First, let's drain the node:

`nodetool drain`{{execute}}

The `drain` command stops writes from occurring on the node and flushes all data to disk. 

Now you're ready to stop the node using one last command:

`nodetool stopdaemon`{{execute}}

You can also verify a node has stopped using the `status` command you learned earlier:

`nodetool status`{{execute}}
