_Note: wait until you see the message "Cassandra has started" in the
terminal before proceeding._

First, verify that Cassandra is properly installed on this machine and is running
as a system service. To do so, you can ask your operating system's daemon
manager:

```
systemctl status cassandra --no-pager
```{{execute T1}}

Look for a green circle and `Active (running)` in the output.

Even better, you can use `nodetool`, Cassandra's utility for node administration:

```
nodetool status
```{{execute T1}}

The output should show that the current node (which forms a cluster by itself)
is in a status "UN" (meaning Up and Normal).

_Make sure Cassandra is completely started before proceeding._

Please run the following to initialize the other terminals of this scenario:
```
echo Initializing terminal 2
```{{execute T2}}

```
echo Initializing terminal 3
```{{execute T3}}

You will use `cqlsh` several times during this exercise. So let us open a
`cqlsh` console and keep it running on the second terminal:

```
cqlsh
```{{execute T2}}
