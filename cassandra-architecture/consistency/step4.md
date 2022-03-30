Now, let's have a little fun. Change your consistency level back to ONE:

`CONSISTENCY ONE;`{{execute}}

Now bring down the other node that was up when we originally did our write. 

`nodetool stopdaemon`{{execute}}
TODO how to determine which node?

Wait for the node to terminate before continuing.

`nodetool status`{{execute}}

Start `cqlsh` again and re-execute the `SELECT` command.

`SELECT *
FROM killrvideo.videos_by_tag
WHERE tag = 'cassandra';`{{execute}}

Notice the query succeeds and the new record is still present. This is because of read repair, which we will explore later.

Update the record to a new title by executing the CQL command that follows. You will have to copy and paste the `video_id` from the result set above into the `UPDATE`'s `WHERE` clause.

`UPDATE killrvideo.videos_by_tag
SET title = 'Me LovEEEEEEEE Cassandra'
WHERE tag = 'cassandra' AND added_date = '2016-02-08' AND video_id = paste_your_video_id;`{{execute}}

Run the following `SELECT` command to ensure your update succeeded:

`SELECT *
FROM killrvideo.videos_by_tag
WHERE tag = 'cassandra';`{{execute}}

Exit `cqlsh`:

`exit`{{execute}}

Now, bring down the node containing your replica. Keep track of which node this is. 

`nodetool stopdaemon`{{execute}}
TODO right node

Wait for the node to terminate before continuing, verifying that both of your replica nodes are now down (the nodes responsible for the `cassandra` tag).

`nodetool status`{{execute}}

Now bring up the other replica node (the one you didn't just shut down). Wait for the node to start up before continuing.

`cassandra -R`{{execute}}
TODO right node

Verify the node is up:

`nodetool status`{{execute}}

Now execute the following `SELECT` command:

`cqlsh -e "SELECT * FROM killrvideo.videos_by_tag WHERE tag = 'cassandra';"`{{execute}}

Your video title may be "Me Lava Cassandra" or "Me LovEEEEEEEE Cassandra" depending on which nodes acted as coordinator on the previous writes and whether they performed hinted handoffs. More on this to come.