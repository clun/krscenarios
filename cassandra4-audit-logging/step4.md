In this step, you will look at some of the configurable properties of audit logging. Then, you will demonstrate setting and unsetting one of these properties.

---
<p>
<span style="color:teal">**Note:**</span> 
All of these properties may be configured in `cassandra.yaml` or with *nodetool*. Properties configured in `cassandra.yaml` persist across server shutdowns. Properties configured with *nodetool* override properties configured in `cassandra.yaml`.
</p>
---

# Configurable Properties

- `enabled`: This option enables/ disables audit log
- `logger`: Class name of the logger/ custom logger.
- `audit_logs_dir`: Auditlogs directory location, if not set, default to cassandra.logdir.audit or cassandra.logdir + /audit/
- `included_keyspaces`: Comma separated list of keyspaces to be included in audit log, default - includes all keyspaces
- `excluded_keyspaces`: Comma separated list of keyspaces to be excluded from audit log, default - excludes no keyspace except system, system_schema and system_virtual_schema
- `included_categories`: Comma separated list of Audit Log Categories to be included in audit log, default - includes all categories
- `excluded_categories`: Comma separated list of Audit Log Categories to be excluded from audit log, default - excludes no category
- `included_users`: Comma separated list of users to be included in audit log, default - includes all users
- `excluded_users`: Comma separated list of users to be excluded from audit log, default - excludes no user

In this example you will use the `excluded categories` property to exclude queries from the audit log. 

<details>
  <summary style="color:teal">List of Audit Log Categories and Operations</summary>
<hr>
<ul>
<li>`QUERY`: SELECT</li>
<li>`DML`: (Data Manipulation Language) UPDATE, DELETE, INSERT, BATCH</li>
<li>`DDL`: (Data Definition Language) TRUNCATE, CREATE_KEYSPACE, ALTER_KEYSPACE, DROP_KEYSPACE, CREATE_TABLE, DROP_TABLE, DROP_TRIGGER, CREATE_INDEX, DROP_INDEX, CREATE_TYPE, DROP_AGGREGATE,ALTER_VIEW, CREATE_VIEW, CREATE_FUNCTION, ALTER_TABLE, CREATE_AGGREGATE, DROP_VIEW, DROP_TYPE,DROP_FUNCTION, CREATE_TRIGGER, ALTER_TYPE</li>
<li>`DCL`: (Data Control Language) LIST_USERS, GRANT, REVOKE, DROP_ROLE, ALTER ROLE, LIST_ROLES, LIST_PERMISSIONS, CREATE_ROLE</li>
<li>`OTHER`: USE_KEYSPACE</li>
<li>`AUTH`: LOGIN_ERROR, UNAUTHORIZED_ATTEMPT, LOGIN_SUCCESS</li>
<li>`ERROR`: REQUEST_FAILURE</li>
<li>`PREPARE`: PREPARE_STATEMENT</li>
</ul>
<hr>
</details>


Click to open *cqlsh*.
```
cqlsh
```{{execute}}

Select Elton John songs.
```
use music;
select * from songs where artist = 'Elton John';
```{{execute}}

Exit *cqlsh*.
```
exit
```{{execute}}

View the audit log.
```
auditlogviewer /var/log/cassandra/audit
```{{execute}}

You should see the most recent query for all Elton John songs.

Use *nodetool* to exclude queries from the audit logs.
```
nodetool enableauditlog --excluded-categories QUERY
```{{execute}}

Open *cqlsh*.
```
cqlsh
```{{execute}}

Select Paul Simon songs.
```
use music;
select * from songs where artist = 'Paul Simon';
```{{execute}}

Exit *cqlsh*.
```
exit
```{{execute}}

View the audit log.
```
auditlogviewer /var/log/cassandra/audit
```{{execute}}

You should see that the query for Paul Simon songs is not in the audit logs.

# Summary

In this step, you explored the configurable properties of audit logging. Next, you used *nodetool* to exclude *queries* from the audit logs. Then, you performed a query and used *auditlogviewer* to verify that the query was not logged.



