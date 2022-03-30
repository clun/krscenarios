Execute the following command:

`nodetool upgradesstables --include-all-sstables`{{execute}}

This command rebuilds SSTables for a specified keyspace and table. We are doing this here to rebuild the Bloom Filters also. Normally this command will only upgrade SSTables if the SSTables are not at the most recent SSTable version; the --include-all-sstables flag forces the rebuild to occur. Normally you would need to run `nodetool upgradesstables `on each node. For the purposes of this scenario, we only have one node.

Now examine the new size of your bloom filter files.

`ls -lh *Filter.db`{{execute}}

Notice the size of these files is larger. We traded space for a smaller chance of a false positive.


