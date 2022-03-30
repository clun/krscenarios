Edit the `/usr/share/cassandra/conf/cassandra-rackdc.properties` file.

# These properties are used with GossipingPropertyFileSnitch and will
# indicate the rack and dc for this node
dc=dc1
rack=rack1

This is the file that the GossipingPropertyFileSnitch uses to determine the rack and data center this particular node belongs to.

NOTE: Racks and datacenters are purely logical assignments to Apache Cassandra™. You will want to ensure that your logical racks and data centers align with your physical failure zones.

Change the dc to west-side and the rack to hakuna-matata.

# These properties are used with GossipingPropertyFileSnitch and will
# indicate the rack and dc for this node
dc=west-side
rack=hakuna-matata

Save and close the cassandra-rackdc.properties file.