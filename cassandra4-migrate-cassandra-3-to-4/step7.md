In this step, you will verify that the Cassandra node has been upgraded and that the data is still available.

Verify that the version is 4.0.0
```
nodetool version
```{{execute T1}}

Make sure the node is in the *UP* and *NORMAL* (*UN*) state.
```
nodetool status | grep -v UN
```{{execute T1}}

Verify that there are no errors.
```
grep -e "WARN" -e "ERROR" /usr/share/cassandra/logs/system.log
```{{execute T1}}

Open a cql shell.
```
cqlsh
```{{execute T1}}

Use the keyspace.
```
USE united_states;
```{{execute T1}}

Verify that the data has been loaded.
```
SELECT * FROM cities_by_state;
```{{execute T1}}

If you can see the data, you have successfullly upgraded from Cassandra 3.11.9 to 4.0.0!