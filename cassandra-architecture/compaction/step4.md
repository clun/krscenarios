Insert a fourth row:

`cqlsh -e "INSERT INTO killrvideo.videos_by_tag (tag, added_date, video_id, title) VALUES ('cassandra', dateof(now()), uuid(), 'Cassandra Ninja');"`{{execute}}

Flush and investigate the data directory again. Wait a few seconds before executing each command.

`nodetool flush`{{execute}}

`ls -l /usr/share/cassandra/data/data/killrvideo/videos_by_tag-*`{{execute}}

Notice that the three previous SSTable files are gone and a new set has appeared. Also, notice that the file names skipped from `mc-3-big` to `mc-5-big`. This new set is the result of the compaction. Cassandra created the fourth SSTable and then compacted all four into a fifth SSTable.
