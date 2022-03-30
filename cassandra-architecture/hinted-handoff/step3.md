You can see that the single node (i.e., the node still running) stored a hint by navigating to its `data/hints/` directory.

`ls -l /usr/sharee/cassandra/data/hints`{{execute}}

You should see two files, each storing all the hints for a single node.

You may also want to try navigating to the other node hints directory and confirm that they are empty (meaning neither is storing hints).

`ls -l /usr/share/cassandra/data/hints`

