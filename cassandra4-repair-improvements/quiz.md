Let's complement this scenario with a small quiz about what you have learnt!

>>1. One should perform data repair: <<
( ) When a node restarts after crashing
( ) Under exceptional circumstances of various kinds
(*) Periodically, similar to other ordinary maintenance operations
( ) Just after a heavy bulk write/data migration

>>2. To check if an SSTable has been repaired already, one can... <<
( ) Execute a SHOW REPAIRED TABLECHUNKS command in cqlsh
(*) Use the sstablemetadata command-line tool
( ) Look into the system.repairs table
( ) Do nothing: there is no way to get this information

>>3. Incremental repair in Cassandra 4.0 is structured with: <<
( ) A transaction; two SSTable pools (repaired/non-repaired)
( ) No transaction; two SSTable pools (repaired/non-repaired)
(*) A transaction; three SSTable pools (repaired/pending/non-repaired)
( ) No transaction; three SSTable pools (repaired/pending/non-repaired)

>>4. The system.repairs table is a virtual table: its contents are potentially different on each node. <<
( ) True
(*) False
