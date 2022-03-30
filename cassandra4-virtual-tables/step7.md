_Now the maintenance is completed and the node load is back to normal.
You could simply revert the timeout setting to its default with
a `nodetool settimeout read 5000` command._

Let's try instead restarting Cassandra on this node to see
if the timeout gets reset to the default of 5 seconds:

```
systemctl restart cassandra
```{{execute T1}}

Wait until `nodetool status` reports state `UN` (=Up, Normal) again:
```
nodetool status
```{{execute T1}}

Now let's look at the timeout value as read through the `system_views.settings`
virtual table:
```
SELECT * FROM system_views.settings WHERE name = 'read_request_timeout_in_ms';
```{{execute T2}}
_(Note: the node may appear unavailable for a short while, in which case you can
repeat this `SELECT` command to see the results.)_

Compare with the output that `nodetool` provides:
```
nodetool gettimeout read
```{{execute T1}}

Has the setting reverted to the default after restarting?
