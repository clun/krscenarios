In this scenario, you will:

* Understand how Apache Cassandra™ performs read-repairs on inconsistent data.

Consistency is the tricky challenge for distributed systems. As distributed systems trade-off consistency for performance, some of the nodes in a cluster may become inconsistent. When Cassandra notices these inconsistencies, Cassandra takes steps to resolve the consistencies. This resolution is the role of Read-Repair.
