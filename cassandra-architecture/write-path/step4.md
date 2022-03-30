Execute the following nodetool command which will flush the memtable contents to disk.

`nodetool flush`{{execute}}

Now check the table stats again by executing this command:

`nodetool cfstats keyspace1.standard1`{{execute}}

Note that the memtable statistics are zeroed out because we flushed the previous memtable to disk.
