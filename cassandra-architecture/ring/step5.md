Now let's determine which nodes own which partitions in the videos_by_tag table. Execute the following query:

SELECT token(tag), tag
FROM videos_by_tag;

How many partitions are there?
On which node does each partition reside?

You can refresh your memory as to which nodes own which token ranges by running the following in the terminal:

`nodetool ring`{{execute}}
