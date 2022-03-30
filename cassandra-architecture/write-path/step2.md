We will now use the cassandra-stress tool to write several thousand records to our node. Execute the following command in your original terminal:

`cassandra-stress write no-warmup n=250000 -port native=9042 -rate threads=1`{{execute}}

Open the second terminal so you can watch as `cassandra-stress` writes 250,000 rows to your node.

There are a few things to watch out for while `cassandra-stress` inserts keys:

* The total size will continue to increase.
* The timestamp will change for the current segment being written.
* You may get additional commit log files as well.

When `cassandra-stress` completes, terminate the watch by pressing CTRL-C.

```
echo "Sending a Ctrl-C"
```{{execute interrupt}}