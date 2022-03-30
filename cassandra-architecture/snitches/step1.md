Edit the `cassandra.yaml` file on `node1`:

`/usr/share/cassandra/conf/cassandra.yaml`{{open}}
 
Use this command to change the `endpoint_snitch` to `GossipingPropertyFileSnitch`:

<pre class="file" data-filename="/usr/share/cassandra/conf/cassandra.yaml" data-target="insert" data-marker="endpoint_snitch: SimpleSnitch">
endpoint_snitch: GossipingPropertyFileSnitch</pre>

You can use the `sed` command to make the same change to the `cassandra.yaml` file on `node2` as well:

`ssh root@node2 "sed -i 's/^endpoint_snitch: .*$/endpoint_snitch: GossipingPropertyFileSnitch/g' /usr/sharee/cassandra/conf/cassandra.yaml"`{{execute}}

