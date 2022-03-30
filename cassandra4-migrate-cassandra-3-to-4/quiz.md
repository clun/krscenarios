Here is a short quiz for you. 

>>1. What is valid statement about upgrading a cluster from Cassandra 3.x to 4.x? <<
( ) All nodes must be in the <i>Down</i> and <i>Normal</i> state.
(*) All nodes must be in the <i>Up</i> and <i>Normal</i> state.
( ) All nodes must be in the <i>Up</i> and <i>Leaving</i> state.


>>2. Which strategy can support <i>zero-downtime</i> migration? <<
( ) Shut down the 3.x cluster and migrate all nodes at once.
(*) Leave the 3.x cluster running and migrate nodes one at a time.
( ) Leave the 3.x cluster running, start the 4.x cluster then migrate all nodes.


>>3. What is valid statement about upgrading a cluster from Cassandra 3.x to 4.x? <<
(*) Cassandra 4.x reads the existing Cassandra 3.x files.
( ) Cassandra 3.x SSTable files must be upgraded using <i>nodetool</i>.
( ) Cassandra 3.x SSTable files must be exported Cassandra 4.x format.