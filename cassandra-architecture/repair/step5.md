Now bring down the node you just barely brought up--the node which you did NOT delete the data files for `videos_by_tag`.

TODO

Start `cqlsh`, and ensure your consistency is ONE.

`cqlsh
CONSISTENCY ONE;`{{execute}}

Execute the following query.

`SELECT *
FROM killrvideo.videos_by_tag
WHERE tag = 'cassandra';`{{execute}}

Note that, this time, we get our data from this node because the previous invocation of the query caused a read repair.
