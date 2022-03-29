Many CQL statements work with tables, indexes and other objects defined within a specific keyspace. 
For example, to refer to a table, we have to either use a fully-qualified name consisting of a keyspace name and a table name, 
or set a working keyspace and simply refer to the table by its name. For convenience, we go with the second option.

Set the current working keyspace:
```
USE killr_video;
```{{execute}}

