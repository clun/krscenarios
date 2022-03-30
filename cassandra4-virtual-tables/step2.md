Let's have a look at the virtual tables that are available, and the specific
keyspaces where these tables are located.

First, list the existing keyspaces in the CQL console with:
```
DESCRIBE KEYSPACES;
```{{execute T2}}

Notice there are two keyspaces named `system_virtual_schema` and `system_views`.
They are special-purpose keyspaces designed to host virtual tables only.

We will work with the `system_views` keyspace, so let us make it the default
one for subsequent operations:
```
USE system_views;
```{{execute T2}}

Get a listing of all tables in this keyspace:
```
DESCRIBE TABLES;
```{{execute T2}}

A virtual table that provides valuable insight into read performance
is the `tombstones_per_read` table: it contains a row for each table
in the database, with statistics on how many tombstones are encountered
while reading.
Let's have a closer look at the table structure with:
```
DESCRIBE TABLE tombstones_per_read;
```{{execute T2}}

Remember that the output of this command is for reference only, since
(as we will soon see) you cannot directly alter these tables.

Look at the primary key for table `tombstones_per_read`: there is indeed
one row for each table in the database.
One can imagine building
a performance-monitoring tool based on the contents of these rows.

Another very important table is the `settings` table.
It provides a way to
programmatically access the whole configuration as specified in file
`cassandra.yaml`.
Try reading the table in its entirety:
```
SELECT * FROM settings;
```{{execute T2}}

How many rows does the table contain? _(Hint: press_ Enter _until you get
to the total row count.)_

Try looking for a particular setting:
```
SELECT value FROM settings where name = 'num_tokens';
```{{execute T2}}

Can you find out what _data type_ the `value` column is? How?
_(Hint: the answer can be found in the output of one of the commands above.)_
Do you have an explanation for this choice of data type?
