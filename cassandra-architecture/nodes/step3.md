Let's have a look at the logging of a Cassandra node. Execute this command to see the current logging levels set on the node: 

`nodetool getlogginglevels`{{execute}}

By default, Cassandra stores its logs in the `logs` directory, which in our case is `/usr/share/cassandra/logs`.

You can see the most recent few lines of Cassandra's main log file with this command:

`tail /usr/share/cassandra/logs/system.log`{{execute}}

Now, you can use the command `setlogginglevel` to dynamically change the logging level used by Cassandra without the need for a restart. For example, you can set the `TRACE` logging level for code in all Java classes in packages starting with `org.apache.cassandra` (basically the entire codebase) with this command:

`nodetool setlogginglevel org.apache.cassandra TRACE`{{execute}}

Now, let's clear the screen and look at the log again to show more detailed messages:

`clear; tail -f /usr/share/cassandra/logs/system.log`{{execute}}

Hit `CTRL-C` to exit the `tail` command:

```
echo "Sending a Ctrl-C"
```{{execute interrupt}}