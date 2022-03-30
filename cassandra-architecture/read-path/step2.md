In your terminal, navigate to the data directory for the large table that cassandra-stress wrote. `cassandra-stress` creates a keyspace called `keyspace1` and a table called `standard1`. You will find the directory as illustrated below, however, your table ID will differ. Use the tab key in the terminal to use helpful autocompletion.

`cd /home/ubuntu/node/data/data/keyspace1/standard1-`{{execute}}

Use the following command to list the bloom filter files for your SSTables:

`ls -lh *Filter.db`{{execute}}

Take note of the file sizes.


