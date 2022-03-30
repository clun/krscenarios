Now, we want to look at the clients currently connected to this node through CQL.
This is done by querying the virtual table `system_views.clients`:

```
SELECT port, connection_stage, driver_name, protocol_version, username FROM clients ;
```{{execute T2}}

Wait a minute ... who are these clients?

It turns out that `cqlsh` uses the Python driver.
This driver keeps two connections alive on two different ports
(the port numbers are chosen dynamically).
So you are simply looking at the connection between your own `cqlsh`
and the node.

Let's create more connections.
First, let's start a Python interpreter console (or _REPL_) and connect to the
node from there.
Go to the third terminal and type
```
python3
```{{execute T3}}

Next, import the Python drivers and use them to connect to the local node
(which is the default connection, so you don't need to provide IP addresses):
```
from dse.cluster import Cluster
cluster = Cluster(protocol_version=4)
session = cluster.connect()
```{{execute T3}}

(Note: the drivers, `dse-driver==2.11.1`, have been preinstalled in Python for
this scenario).

In the Python REPL, try the following loop - which achieves the same effect
as the query you ran earlier in `cqlsh` - **press Enter** to
make it run:
```
rows = session.execute('SELECT port, connection_stage, '
                       'driver_name, protocol_version FROM '
                       'system_views.clients')
for row in rows:
    print('%5i  %8s  %36s  %2i' % (
        row.port, row.connection_stage,
        row.driver_name, row.protocol_version
    ))
```{{execute T3}}

How many rows are there? Look at the ports used and the protocol versions.
Notice that the latter matches the required version specified a few lines above,
when creating the `Cluster` object (`protocol_version=4`).

Suppose you want to make sure all your clients have been upgraded to the
more recent protocol (version 5). Check by issuing, in `cqlsh`,
the following command (note its `WHERE` clause):
```
SELECT address, protocol_version, username FROM clients WHERE protocol_version < 5 ALLOW FILTERING ;
```{{execute T2}}

Recall that for virtual tables there's no need to worry about
full-cluster scans.
