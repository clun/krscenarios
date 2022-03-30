We will launch an incremental repair on Node2, expecting that
it will be able to restore consistency and align its SSTables to
reflect the deletion of non-gaseous elements we executed on Node1.

### Repairing data

Let us initiate an incremental repair on Node2, limited to our `elements` table.
Starting from Cassandra 2.2, incremental repair (as opposed to full repair)
is the default, so we simply need to launch the command
```
nodetool repair chemistry elements
```{{execute T6}}

Given our extremely small volumes of data (about a hundred rows and a
  hundred tombstones), it will take a couple of seconds or so.
  Look for "completed successfully" in the output.

So it looks like the data was repaired! Since this cluster is running
Cassandra 4.0, _during_ repair the involved SSTables were kept in a separate
"pending-repair" pool, protected from compaction.

The whole repair process (that in real clusters may last much longer) is
coordinated among nodes with a transaction: at the end, the newly-created
SSTables are either moved to the "repaired" pool or, in case of failure,
rolled back to the "non-repaired" state. In any case, huge undeserved
misalignments between nodes are kept to a minimum and limited to cases of actual
data mismatch (and not simple placement in different SSTable pools), thus
preventing the "overstreaming explosions" that could occur in previous versions.

Both the transaction around the repair process and the existence of three
separate pools of SSTables are improvements introduced in Cassandra 4.0.

### SSTable inspection

Enough with the theory - let's look at the SSTables on Node2 now and at their
"repair status", as we did in Step 2, by running
the following on the console of Node2:
```
ls /usr/share/cassandra/data/data/chemistry/elements-<TABLE_ID>
```{{Execute T6}}
(**NOTE**: you need the actual ID for the data directory, which you
can obtain with `ls /usr/share/cassandra/data/data/chemistry/`.)

Pick any one of the SSTable files (`[...]-Data.db`) and examine it with
`sstablemetadata` (**NOTE**: in this command as well, replace the actual
  table ID and the SSTable file name):
```
sstablemetadata /usr/share/cassandra/data/data/chemistry/elements-<TABLE_ID>/<SSTABLE_ROOT_NAME>-Data.db
```{{Execute T6}}

You should see that the SSTable is marked as "repaired" in the output, as in:
```
...
Repaired at: 1629721911103 (08/23/2021 12:31:51)
Pending repair: --
...

```

The human-readable date format in the output is a nice touch added in
version 4.0.

Note that, should the repair take a substantial time, you would be able to
see the SSTable marked as belonging the "pending repair" pool for the duration
of the repair, with the ID of the running repair displayed in the table metadata:
```
...
Repaired at: 0
Pending repair: 176e98a0-040e-11ec-a1ad-afb77b90bb63
...
```

### History of repairs

The
[command-line tool](https://cassandra.apache.org/doc/latest/cassandra/tools/nodetool/repair_admin.html)
`nodetool repair_admin` allows one to list current and
past repair operations, and can be also used to stop a running repair
(on the same node it is executed on, but also on another node with a `--force`
option).

Run the following command on the console of Node2 to see the repair you just
performed (withouth the `--all` flag you would only see
  currently-running repairs):
```
nodetool repair_admin list --all
```{{execute T6}}

You can also query the `system.repairs` table for a history of all repair
operations run on the cluster. Note that this is _not_ a virtual table:
the contents are accessible from any node in the cluster with no differences.

Run this command in the first node's `cqlsh`:
```
SELECT parent_id, coordinator, coordinator_port, last_update, repaired_at, started_at, state, cfids, participants, participants_wp
  FROM system.repairs;
```{{execute T4}}

### Last test

Has the data really been repaired? Let us check with a final test:
we now bring down Node1 and then query the `elements` table from Node2!

Let us shut down Cassandra on Node1, by running this command in its console:
```
nodetool stopdaemon
```{{execute T3}}

**Important note** We are bringing down a node for demonstration purposes.
Please think twice before doing that in production as, depending on the
consistency levels of the queries being run, this might disrupt operativity
of the applications.

You should see the command announcing that Cassandra is stopped. Now there is
only Node2, so we are effectively looking at the contents of its own SSTable
files. Let's query the `elements` table on Node2's `cqlsh`:
```
SELECT * FROM chemistry.elements;
```{{execute T7}}

If you see just a handful of gaseous elements, congratulations! Consistency
has been successfully restored by bringing the latest changes on the table
from Node1 over to this node: **incremental repair has done its job**.

### Recap

We have incrementally repaired the table on Node2 and verified data
consistency in the strictest way, i.e. by turning off the other node
and querying the repaired one.

Repair is a maintenance operation that has to be executed periodically. Please
remember that repair is a per-node process: it must be executed on one node
after the other to ensure the whole cluster is repaired -
there are, fortunately, tools to automate this process and schedule it in
a robust way.

This interactive experience is over, so let's head to a short quiz to
consolidate what you just learnt!
