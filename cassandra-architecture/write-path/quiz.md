Write Path Quiz

>>1. The purpose of the commit log is...<<
( ) to later serve reads.
(*) to replay if a crashed node restarts.
( ) to store the data sorted by clustering columns.
( ) to serve as a copy of the memtable

>>2. When does a client acknowledge a write?<<
( ) After the commit log and SSTable are written
( ) After the MemTable and SSTable are written
( ) After the MemTable is written
(*) After the commit log and MemTable are written

>>3. Which of the following are stored sorted by clustering columns? Check all that apply.<<
( ) Commit log
(*) SSTable
( ) Heap table
(*) memtable