Start node1. 

`cassandra -R`

Watch the logs for the statement TBD

You can verify the node is up using `nodetool`:

`nodetool status`{{execute}}

Once `node1` is up, start `node2`:

`ssh root@node2 "/usr/share/cassandra/bin/cassandra -R"`{{execute}}

You can re-run the status command multiple times to watch as `node2` comes online:

`nodetool status`{{execute}}

Notice the differing data center assignments now.
