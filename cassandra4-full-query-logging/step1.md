In this step, you will enable full query logging via *nodetool*.

We've already started a single node Cassandra cluster for you in the background. When the command prompt appears in the terminal, the node is initialized and ready to go.

First, let's create a directory to store our full query log files:

```
mkdir /tmp/fqllogs
```{{execute}}

Now you can connect to the node using nodetool and enable full query logging, using the directory we just created as the path:

```
nodetool enablefullquerylog --path /tmp/fqllogs
```{{execute}}

To get a listing of the other options available on this command, execute the following:

```
nodetool help enablefullquerylog
```{{execute}}

# Summary

In this step, you enabled full query logging dynamically on a running Cassandra node using *nodetool* and learned about the available options on the `enablefullquerylog` command.
