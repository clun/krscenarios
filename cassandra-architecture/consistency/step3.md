Again, start up `cqlsh` and reset the consistency level to `TWO`:

`cqlsh
CONSISTENCY TWO;
USE killrvideo;`{{execute}}

Retrieve the `cassandra` partition by executing the following command in `cqlsh` 

`SELECT *
FROM killrvideo.videos_by_tag
WHERE tag = 'cassandra';`{{execute}}

The query will error out because you cannot achieve a consistency level of `TWO` since you took one of the needed nodes down.

Set the consistency level back to `ONE`:

`CONSISTENCY ONE;`{{execute}}
`
Now retry your query:

`SELECT *
FROM killrvideo.videos_by_tag
WHERE tag = 'cassandra';`{{execute}}

The query succeeds because you still have one replica node available.

Change the consistency level back to `TWO`:

`CONSISTENCY TWO;`{{execute}}

Let's try inserting a new row into the `cassandra` partition by executing the following command:

`INSERT INTO killrvideo.videos_by_tag (tag, added_date, video_id, title)
VALUES ('cassandra', '2016-2-8', uuid(), 'Me Lava Cassandra');`{{execute}}

Notice the write failed because we still cannot achieve a consistency level of two.

Change the consistency level back to `ONE`:

`CONSISTENCY ONE;`{{execute}}

Now try the `INSERT` again:

`INSERT INTO videos_by_tag (tag, added_date, video_id, title)
VALUES ('cassandra', '2016-2-8', uuid(), 'Me Lava Cassandra');`{{execute}}

The write succeeds. Exit `cqlsh`:

`exit`{{execute}}

Now restart the node you took down. 
TODO make sure its the right node

`cassandra -R`{{execute}}

Wait for it to finish starting up before continuing.

`nodetool status`{{execute}}

Open `cqlsh` again and set your consistency level back to `TWO`:

`cqlsh
CONSISTENCY TWO;`{{execute}}

Now run the `SELECT` command again:

`SELECT *
FROM killrvideo.videos_by_tag
WHERE tag = 'cassandra';`{{execute}}

Notice the new record is present.