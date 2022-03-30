We will now decrease the probability that a bloom filter will return a false positive and see how this affects the bloom filter files sizes.

Start `cqlsh` and execute the following command to view the current bloom filter settings:

`cqlsh
DESCRIBE keyspace keyspace1;` {{execute}}

Note the `bloom_filter_fp_chance` is 0.01, meaning a 1% chance of a false positive. That's pretty good, but if we want an even smaller chance, we can trade space for it.

Execute the following command:

`ALTER TABLE keyspace1.standard1 WITH bloom_filter_fp_chance = 0.0001;`{{execute}}

Now that we have changed the `bloom_filter_fp_chance`, we must update our SSTables and associated bloom filter files.

`exit`{{execute}}
