In this scenario, you will:

* Understand basic Apache Cassandra™ compaction strategies

As memtables fill up, Cassandra writes them to disk in the form of SSTables. If this were the end of the story, the number of data files used to contain SSTables would become large and slow the Cassandra read performance. Therefore, Cassandra must consolidate these files from time to time. This consolidation is called compaction.

In this exercise, we observe the effects of compaction.
