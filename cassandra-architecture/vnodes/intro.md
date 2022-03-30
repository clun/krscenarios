In this scenario, you will:

* Understand how VNodes support partition distribution.

The ring of tokens and nodes make Apache Cassandra™ scalable and fault-tolerant, but managing partitions on solely physical nodes causes problems. For example, when a physical node goes down, it is necessary to redistribute partitions. This is where virtual nodes (or VNodes) come in. VNodes help even the load when redistributing partitions across physical nodes.

In this scenario, we are going to change from using single token nodes to using vnodes. Cassandra doesn't allow changing the num_tokens settings after a node has joined the cluster, so we must set this up before we start our nodes.