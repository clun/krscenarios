Edit /home/ubuntu/node2/resources/cassandra/conf/cassandra-rackdc.properties and change its dc to east-side and rack to hakuna-matata. Although the rack names between the two data centers are the same, each rack lives in a unique data center (west-side vs. east-side).

# These properties are used with GossipingPropertyFileSnitch and will
# indicate the rack and dc for this node
dc=east-side
rack=hakuna-matata
