We will now stress the node using a simple tool called Apache Cassandra(TM) Stress. Once your node has restarted, navigate to the /home/ubuntu/node/resources/cassandra/tools/bin directory in the terminal. Run cassandra-stress to populate the cluster with 50,000 partitions using 1 client thread and without any warmup using:

./cassandra-stress write n=50000 no-warmup -rate threads=1

Initially, we will see a long list of setting for the stress run. As `cassandra-stress` executes, it logs several statistics to the terminal. Each line displays the statistics for the operations that occurred each second and shows number of partitions written, operations per second, latency information, and more.
