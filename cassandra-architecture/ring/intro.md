One of the secrets to Apache Cassandra's™ performance is the use of a ring that keeps track of tokens. This ring enables Cassandra to know exactly which nodes contain which partitions. The ring also eliminates any single points of failure.

In this scenario, you will:

* Understand the Cassandra token ring
* Create a two-node cluster

