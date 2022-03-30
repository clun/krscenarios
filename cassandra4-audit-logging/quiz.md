Here is a short quiz for you. 

>>1. What is valid statement about audit log configuration in Cassandra? <<
( ) Audit log configuration set with <i>nodetool</i> persists across server restarts.
( ) Audit log configuration set with <i>nodetool</i> applies to all nodes in a cassandra cluster.
(*) Audit log configuration set with <i>nodetool</i> overrides configuration set in <code>cassandra.yaml</code>.


>>2. How should you handle sensitive data when sharing audit logs? <<
( ) Audit logs do not contain sesitive data.
(*) Manually redact sensitive data in the audit logs.
( ) Use <i>nodetool</i> to redact specific fieds in the audit logs.


>>3. Which command disables the audit log for the finance keyspace? <<
( ) <code>nodetool auditlog --ignore finance</code>
( ) <code>nodetool auditlog --disable --keyspace finance</code>
(*) <code>nodetool enableauditlog --excluded-keyspaces finance</code>
