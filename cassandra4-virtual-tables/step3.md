Virtual tables and their related keyspaces impose several restrictions
on the kinds of operations that can be performed.

Find out if you can add a column to a virtual table:
```
ALTER TABLE settings ADD comment TEXT;
```{{execute T2}}

_(Note: this command and the next ones will produce an error in the
  `cqlsh` console.)_

Find out if you can upsert a new row to a virtual table:
```
INSERT INTO settings (name , value ) VALUES ( 'MaxNumberOfGlorxes', '137');
```{{execute T2}}

Find ouf if you can clear the contents of a virtual table:
```
TRUNCATE settings ;
```{{execute T2}}

Find out if you can create an index:
```
CREATE INDEX ON settings (value) ;
```{{execute T2}}

Virtual tables can be queried with the same syntax as regular tables.
Suppose we want to list all (Boolean) settings that are set to "true":
```
SELECT name FROM settings WHERE value='true';
```{{execute T2}}

This query, as it is, will fail with a standard message about _data filtering_
(which is how CQL advises against full-cluster scans).
Thanks to the fact that virtual tables are **not** actually distributed,
however, it is
perfectly fine to add the `ALLOW FILTERING` clause to such a query
(indeed, this is one of the very few cases it is acceptable to):

```
SELECT name FROM settings WHERE value='true' ALLOW FILTERING ;
```{{execute T2}}

This observation will come handy in next step.