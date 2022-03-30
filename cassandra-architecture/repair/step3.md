Take down the other node that is responsible for the `cassandra` partition in the `videos_by_tag` table. Wait for it to terminate before continuing.

Now bring up the downed node (the one you deleted the data files for). Wait for the node to come up before continuing.

In `cqlsh`, execute the query that follows. What do you think the results will be?

`cqlsh -e  "SELECT * FROM killrvideo.videos_by_tag WHERE tag = 'cassandra';"`{{execute}}

The result is empty because we deleted the data files on that node for `videos_by_tag`.