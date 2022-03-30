Cassandra 4.x full query logging enables you to get the exact CQL query strings used by your client applications. This information can be used for:
- Analyzing poorly performing queries 
- Debugging queries that are producing incorrect results
- Live traffic capture and replay
- Troubleshooting/Debugging

In this scenario you will:

- Enable and disable full query logging statically (in *cassandra.yaml*) and dynamically (using *nodetool*).
- Learn features of the full query logging tool *fqltool*
- Read and interpret full query logs
