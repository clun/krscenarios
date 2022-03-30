Now execute the following command:

`cqlsh -e "ALTER TABLE keyspace1.standard1 WITH bloom_filter_fp_chance = 1.0;"`{{execute}}

And update your SSTables once again in your terminal:

`nodetool upgradesstables --include-all-sstables`{{execute}}

Now examine the new size of your bloom filter files.

`ls -lh *Filter.db`{{execute}}

Now what is the size of your bloom filter files? Why? :)

Now execute the following command in your terminal:

`nodetool cfstats keyspace1.standard1`{{execute}}

Part of the stats include bloom filter information. Since we have not read from the `cassandra-stress` tables, the values are all zero. You can use these stats to tune Cassandra.

