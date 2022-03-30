Start cqlsh and execute the following query of the system.peers table which stores some gossip data about a node's peers.

`SELECT peer, data_center, host_id, preferred_ip, rack, release_version, rpc_address, schema_version
FROM system.peers;`{{execute}}

Notice the values here are some of the same values you saw in the terminal. Also notice that a node does not store a row of peer data for itself. By default, cqlsh connects to 127.0.0.1.
