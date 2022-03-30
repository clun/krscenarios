Now start `cqlsh` again on the remaining node:

`ccm <node> cqlsh`

Set your consistency level back to `ONE`:

`CONSISTENCY ONE;`{{execute}}

Try reading the new record back by executing the following `SELECT` command:

`SELECT * FROM killrvideo.videos_by_tag;`{{execute}}

The query fails because even though one node is up, that node doesn't cover the entire token range itself. So, Cassandra cannot be sure that all records will be accounted for even with a consistency level of `ONE`.

Exit `cqlsh`:

`exit`{{execute}}


