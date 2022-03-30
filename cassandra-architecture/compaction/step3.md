Create a third SSTable by inserting the following row:

`cqlsh -e "INSERT INTO killrvideo.videos_by_tag (tag, added_date, video_id, title) VALUES ('cassandra', dateof(now()), uuid(), 'Cassandra Wizard');"`{{execute}}

Once again, flush the memtable to disk and investigate the data directory:

`nodetool flush`{{execute}}

`ls -l /usr/share/cassandra/data/data/killrvideo/videos_by_tag-*`{{execute}}

NOTE: When Cassandra goes to create a fourth SSTable, it will perform compaction.
