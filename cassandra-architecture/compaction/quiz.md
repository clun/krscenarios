Compaction Quiz

>>1. Which of the following are benefits from compaction? Check all that apply.<<
[*] More optimal disk usage
[*] Faster reads
[ ] Cassandra responds quick while compacting
[*] Less memory pressure

>>2. All tombstones are discarded during compaction.<<
( ) TRUE 
(*) FALSE 

>>3. In which of the following scenarios would a new partition on disk be larger than either of its input partition segments after a compaction?<<
( ) The input partitions are full of tombstones whose timestamps are greater than gc_grace_seconds.
( ) Input partition segments are mostly made up of UPDATE operations.
( ) The input partitions are not liable candidates for compaction.
(*) The input partition segments are made up of mostly INSERT operations.