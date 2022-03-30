_A heavy exceptional maintenance task is starting on your node:
you need to temporarily
raise the read timeout to 18 seconds until the task is over. This way, you'll
prevent the application from repeatedy timing out
(increased latency is more acceptable in your case)._

You sure don't want to edit `cassandra.yaml` and restart the nodes, so you
decide to change this setting on the fly, with:
```
nodetool settimeout read 18000
```{{execute T1}}

(remember writing on a virtual table is not supported... yet.)

Now, does the `cassandra.yaml` automatically reflect this change?
```
grep "read_request_timeout_in_ms:" /etc/cassandra/cassandra.yaml
```{{execute T1}}

Does `nodetool` itself reflect the change?
```
nodetool gettimeout read
```{{execute T1}}

Does the virtual-table method give you the newly-set value of 18000?
```
SELECT * FROM system_views.settings WHERE name = 'read_request_timeout_in_ms';
```{{execute T2}}
