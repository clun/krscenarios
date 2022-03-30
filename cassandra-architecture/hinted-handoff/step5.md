Bring one replica node back up. 

TODO correct node
`cassandra -R`{{execute}}

Wait for to startup before continuing. 

`nodetool status`{{execute}}

Now, investigate the `hints/` directory. 

`ls -l /usr/share/cassandra/data/hints`{{execute}}

You will see that one of the hint files has disappeared. This is due to this node forwarding the hints to the newly bootstrapped node.

Now try the `SELECT` command one more time:

`cqlsh -e "SELECT * FROM killrvideo.videos_by_tag;"`{{execute}}

The query succeeds and returns our new row.

Now bring up the remaining offline node. 

TODO correct node
`cassandra -R`{{execute}}
                                         
Wait for to startup before continuing. 
                                       
`nodetool status`{{execute}}

Again, you will notice some file activity in the `hints/` folder, and eventually the folder will clear.

`ls -l /usr/share/cassandra/data/hints`{{execute}}

Thus, the two replica nodes now each have their hinted records.

NOTE: Versions of Cassandra prior to 3.0 stored their hints in actual tables.