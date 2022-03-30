We've already installed Cassandra at `/usr/share/cassandra` and started a Cassandra node for you in the background using the command:

`cassandra -R`

We also added `/usr/share/cassandra/bin` and `/usr/share/cassandra/tools/bin` to the path to make it easy to execute some of the tools that come with Cassandra.

In this scenario, you'll learn how to use one of those tools; `nodetool`  supports various status and management functions.

Execute `nodetool` with the `help` command to list all possible commands.

`nodetool help`{{execute}}

Some commands display information about the entire cluster, while other commands show information only about the node that `nodetool` has connected to. Others are operations that can be run specifically on the connected node. In this case, the connected node is the one running on the local host. To connect to another host, use the `-h` option with its IP address.

Next, try the `status` command:

`nodetool status`{{execute}}

You'll see the single node we've started in the results. If the node has completed startup, you will see the state `UN` which means that the node is Up and its operational status is Normal. (If you see the state `DN`, repeat the `nodetool status` command by clicking on it again.)

The `status` command shows information about the entire cluster, particularly the state of each node, and information about each of those nodes: IP address, data load, number of tokens, total percentage of data saved on each node, host ID, data center, and rack. We will discuss these in detail as the series progresses.

