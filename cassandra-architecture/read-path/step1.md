To begin, we need to populate a single-node cluster with a good chunk of data. We will use cassandra-stress to do so. Execute the following command in a terminal window. Wait for cassandra-stress to complete before continuing.

`cassandra-stress write no-warmup n=250000 -port native=9042 -rate threads=1`{{execute}}

Take a visit to the water cooler while this executes. Catch up with your coworkers, shoot the bull, etc.

Now force Cassandra to flush its current memtable to disk by executing the following command:

`nodetool flush`{{execute}}
