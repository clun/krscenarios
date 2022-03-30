In this scenario, you will:

* Understand how to make Apache Cassandra™ aware of the cluster topology using Snitches.

To improve fault-tolerance, distributed systems must consider the topology of the cluster into account. Cassandra uses this topological information to replicate data across a geological diverse area - which increases data availability.

In this scenario we will change the snitch and rack assignments for our two nodes. We will decommission each node (remove it from the cluster), reset the node's data, etc.
