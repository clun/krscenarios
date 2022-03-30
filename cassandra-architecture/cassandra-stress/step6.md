We will now examine the data cassandra-stress wrote to our node. Start ./cqlsh. Execute the following CQLSH command to view the current keyspaces:

`DESCRIBE KEYSPACES;`{{execute}}

Notice the presence of `keyspace1` which cassandra-stress created.

Switch to that keyspace by executing the following:

`USE keyspace1;`{{execute}}

View the tables in `keyspace1` by executing the following:

`DESCRIBE TABLES;`{{execute}}

Query the first five rows from `standard1` by executing the following query:

`SELECT * FROM standard1 LIMIT 5;`{{execute}}

The data that was written is not very meaningful, since they are all arbitrary BLOB values.
