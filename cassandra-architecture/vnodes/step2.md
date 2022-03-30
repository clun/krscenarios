Run:

`nodetool status`{{execute}}

Notice each node now has 128 tokens.

Now execute:

`nodetool ring`{{execute}}

Notice that each node is responsible for several smaller sections of the ring.


TODO to make this even better, add another node to the ring and see how the ranges change