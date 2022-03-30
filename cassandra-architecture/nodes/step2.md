Now try:

`nodetool info`{{execute}}

The `info` command displays information about the connected node, which includes token information, host ID, protocol status, data load, node uptime, heap memory usage and capacity, data center and rack information, number of errors reported, cache usage, and percentage of SSTables that have been incrementally repaired. Again, we will cover most of these later.

Next, have a look at: 
                     
`nodetool describecluster`{{execute}}
                     
The `describecluster` command shows the settings that are common across all of the nodes in the cluster and the current schema version used by each node. We have a simple one node cluster in this scenario but we'll work with larger clusters in future scenarios.