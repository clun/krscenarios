Now, we want to _show_ you some of the changes.

Let's start by taking a look at the cluster we have set up.

```
nodetool status
```{{execute}}

We see there are two datacenters with one node each.
In a real-life production cluster, you can usually expect to have 3 or more nodes per datacenter, but for this demo, we only need two nodes.
