Now we will re-import our KillVideo data. Open cqlsh. 

`cqlsh`{{execute}}

Execute the following CQL `CREATE KEYSPACE` statement to use `NetworkTopologyStrategy` with replication set to store one replica per data center:


`CREATE KEYSPACE killrvideo
WITH replication = {
    'class': 'NetworkTopologyStrategy',
    'east-side': 1,
    'west-side': 1
};`{{execute}}

Switch to the `killrvideo` keyspace:

`USE killrvideo;`{{execute}}

Now create a `videos_by_tag` table and import some data. Execute the following commands:

`CREATE TABLE videos_by_tag (
    tag text,
    video_id uuid,
    added_date timestamp,
    title text,
    PRIMARY KEY ((tag), added_date, video_id))
    WITH CLUSTERING ORDER BY (added_date DESC);`{{execute}}

`COPY videos_by_tag(tag, video_id, added_date, title)
FROM 'videos-by-tag.csv' WITH HEADER=TRUE;`{{execute}}

