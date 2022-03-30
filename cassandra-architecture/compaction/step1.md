For this scenario, you will only need a single node, which we've started for you already and launched `cqlsh`.

Go ahead and create the `killrvideo` keyspace and also create the `videos_by_tag` table:

`CREATE KEYSPACE killrvideo WITH replication = {'class':'SimpleStrategy', 'replication_factor': 1};`{{execute}}

`CREATE TABLE killrvideo.videos_by_tag (
  tag TEXT,
  video_id UUID,
  added_date TIMESTAMP,
  title TEXT,
  PRIMARY KEY ((tag), video_id)
);`{{execute}}

Now, insert a single row into the table:

`INSERT INTO killrvideo.videos_by_tag (tag, added_date, video_id, title)
    VALUES ('cassandra', dateof(now()), uuid(), 'Cassandra Master');`{{execute}}

Next, exit `cqlsh`: 

`exit`{{execute}}
 
At the shell, use `nodetool` to force Cassandra to flush the memtable to an SSTable:

`nodetool flush`{{execute}}

Let's investigate the SSTable in the node's data directory. Remember the actual name of the directory will be a unique random value:

`ls -l /usr/share/cassandra/data/killrvideo/videos_by_tag-*`{{execute}}

You will see several files with names that start with. These are the files associated with the first SSTable.
