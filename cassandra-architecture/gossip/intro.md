In this scenario, you will:

* Understand how Apache Cassandra™ uses gossip.
* Understand how gossip information propagates through a cluster.
* Understand how a gossip exchange works.

In a fully distributed system such as Cassandra, there is no single repository that contains the state of all the nodes in the cluster. Clearly, such a repository would be a single point of failure. Instead, Cassandra uses the Gossip protocol to distribute nodes' status amongst its peers.

In this scenario, we will examine the gossip information for our two-node cluster.
