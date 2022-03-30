In this step, we will verify that the Cassandra 3.x cluster is ready to be upgraded. There are 9 factors to consider:

**Current State**
All nodes in the cluster need to be in an ‘Up and Normal’ state. Check that there are no nodes in the cluster that are in a state different to *Up and Normal*. This command will list any nodes **not** in the *UN* state.
```
nodetool status | grep -v UN
```{{execute T1}}

**Disk Space**
Verify that each node has at least 50% diskspace free.
```
df -h
```{{execute T1}}

**Errors**
Ensure that there are no unresolved errors on nodes. Take alook at logged warnings as well.

```
grep -e "WARN" -e "ERROR" /usr/share/cassandra/logs/system.log
```{{execute T1}}

**Gossip Stable**
Verify all entries in the gossip information output have the gossip state ‘STATUS:NORMAL’. Use the following command to check if there are any nodes that have a status other than ‘NORMAL’.
```
nodetool gossipinfo | grep STATUS | grep -v NORMAL
```{{execute T1}}

**Dropped Messages**
Establish no Dropped Message log messages have been recorded on any node in the previous 72 hours.
```
nodetool tpstats | grep -A 12 Dropped
```{{execute T1}}

**Backups Disabled**
Verify that all automatic backups have been disabled. This includes disabling *Medusa* and any scripts that call `nodetool snapshot` until the upgrade is complete.

**Repair Disabled**
Verify that *repairs* have been disabled. This includes disabling automated repairs in *Reaper*.

**Monitoring**
Upgrading may result in a temporary reduction in performance, as it simulates a series of temporary node failures. Understanding how the upgrade impacts the performance of the system, both during and after, is crucial when working through the process. 

**Availability**
Confirm that areas of the application that require Strong Consistency are using the `LOCAL_QUORUM` Consistency Level and a Replication Factor of 3.

When `LOCAL_QUORUM` is used with a Replication Factor below 3, all nodes must be available for requests to start. A rolling restart using this configuration will result in full or partial unavailability while a node is *DOWN*. 

---

Clear the screen.
```
clear
```{{execute T1}}

You are now ready to continue to the next step and begin the upgrade.