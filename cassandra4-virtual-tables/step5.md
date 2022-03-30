Virtual tables are also a great way to access all sorts of settings and
configuration parameters for a Cassandra node.

Let's turn our attention to the **read request timeout**, a quantity that
specifies how long this node will wait before timing out when it's acting
as read query coordinator.

You can look for the setting directly in the `cassandra.yaml` file:
```
grep "read_request_timeout_in_ms:" /etc/cassandra/cassandra.yaml
```{{execute T1}}

Alternatively you can use the corresponding `get*`
operation offered by `nodetool`:
```
nodetool gettimeout read
```{{execute T1}}

With virtual tables, the same information is now available with a `SELECT`:
```
SELECT * FROM system_views.settings
    WHERE name = 'read_request_timeout_in_ms';
```{{execute T2}}

In most situations, the default setting (5000 milliseconds)
is perfectly fine; however, there may be exceptions, as we will soon see.

