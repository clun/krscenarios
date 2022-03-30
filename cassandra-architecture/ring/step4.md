Now let's recreate the two tables we made in previous scenarios and import their data. Start cqlsh and execute the commands that follow:

`cqlsh
CREATE KEYSPACE killrvideo
WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1 };
`{{execute}}

Now use the `killrvideo` keyspace and create the `videos` table:

USE killrvideo; {{execute}}

`CREATE TABLE videos (
    id uuid,
    added_date timestamp,
    title text,
    PRIMARY KEY ((id))
);`{{execute}}

`COPY videos(id, added_date, title)
WITH HEADER=TRUE;`{{execute}}

FROM '~/videos.csv'
`CREATE TABLE videos_by_tag (
    tag text,
    video_id uuid,
    added_date timestamp,
    title text,
    PRIMARY KEY ((tag), added_date, video_id))
    WITH CLUSTERING ORDER BY(added_date DESC);`{{execute}}

COPY videos_by_tag(tag, video_id, added_date, title)
FROM '/home/ubuntu/labwork/data-files/videos-by-tag.csv'
WITH HEADER=TRUE;
