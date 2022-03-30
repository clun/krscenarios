In this step, we will prepare the Cassandra 3.x cluster for the upgrade.

Take a snapshot of the node in case you need to roll back thE upgrade. 
(`nodetool snapshot` also flushes the memtables to disk)
```
nodetool snapshot
```{{execute T1}}

Stop the node by finding the PID and calling kill.
```
pgrep -u root -f cassandra | xargs kill -9
```{{execute T1}}

Use nodetool to verify that the server has been shut down.
```
nodetool status
```{{execute T1}}

Clear the screen and continue.
```
clear
```{{execute T1}}

The node has been shutdown, continue to the next step.