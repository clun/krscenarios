We are about to bring the cluster to the conditions that warrant a data
repair; but first, we have to make sure all recently-inserted rows, probably
still lingering in memory (in the memtables), are flushed to disk in the
form of SSTables.

### Flushing data

Each time a table is created, it gets an ID that is used, among other things,
also in the name of the directory containing the corresponding data.
To identify the full name of the data directory for `elements`, look at
the result of this command on Node1:
```
ls /usr/share/cassandra/data/data/chemistry/
```{{Execute T3}}
The output will be something similar to
`elements-8f40e960043011ec8f376feadc8291b4`.

Since the rows we just inserted are just a few, probably the data directory
is still empty:
this can be verified with (**NOTE**: copy and paste the
  actual ID in the command before executing):
```
ls /usr/share/cassandra/data/data/chemistry/elements-<TABLE_ID>
```{{Execute T3}}
(there should just be a `backups` subdirectory for incremental backups - we
  can ignore it here.)

Now we can force a flush of all insertions to disk, by executing the following
command on both nodes:
```
nodetool flush  # Node1
```{{Execute T3}}

```
nodetool flush  # Node2
```{{Execute T6}}

This time, inspection of the data directory will confirm that at least
one SSTable has been created: remember that you can use the up-arrow key to
bring up a command you already typed, and re-execute the following:
```
ls /usr/share/cassandra/data/data/chemistry/elements-<TABLE_ID>
```{{Execute T3}}
You will now see the SSTable files.
Notice in particular a file named `[...]-Data.db`, where the actual contents
  of the table are stored.

### Examining SSTables

You can examine the repair status of this brand new SSTable with the following
command (**NOTE**: again, replace the actual table ID and the SSTable
  file name for the command to work):
```
sstablemetadata /usr/share/cassandra/data/data/chemistry/elements-<TABLE_ID>/<SSTABLE_ROOT_NAME>-Data.db
```{{execute T3}}

Look for the repair information in the output: there should be two lines such as
```
...
Repaired at: 0
Pending repair: --
...
```

meaning, respectively, that the table has never been repaired yet,
and is not currently in the pending-repair pool of any running repair.

### Recap

We have forced a data flush to disk to make sure our SSTable files
are up-to-date; indeed the files are there and, as expected, have
never undergone any repair operation (...yet).

Now it's time to engineer a data misalignment between the two nodes,
to later see incremental repair in action!
