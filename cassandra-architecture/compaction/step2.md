You can create a second SSTable. Add a second row using the following:

`cqlsh -e "INSERT INTO killrvideo.videos_by_tag (tag, added_date, video_id, title) VALUES ('cassandra', dateof(now()), uuid(), 'Cassandra Genius');"`{{execute}}

Flush this second memtable to disk:

`nodetool flush`

Re-inspect the data directory to see the files associated with the _two_ SSTables:

`ls -l /usr/share/cassandra/data/data/killrvideo/videos_by_tag-*`{{execute}}
