Execute the following `nodetool` command:

`nodetool cfstats keyspace1.standard1`{{execute}}

`cassandra-stress` created the `keyspace1.standard1` table and populated its data. `cfstats` gives you column family stats (column family is a deprecated term for a table).

Notice the "Write Count" matches the number of rows we told `cassandra-stress` to insert. `cfstats` also reports the number of SSTables, space used, and bloom filter statistics.

Also note the Memtable statistics.
