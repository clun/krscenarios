If you are familiar with SQL, CQL may look quite similar. 
Indeed, there are many syntactic similarities between the two languages, but there are also many 
important differences. Here are just a few facts about CQL that highlight some of the differences:

- CQL supports tables with single-row and multi-row partitions
- CQL table primary key consists of a mandatory partition key and an optional clustering key
- CQL does not support referential integrity constraints
- CQL updates or inserts may result in upserts
- CQL queries cannot retrieve data based on an arbitrary table column
- CQL supports no joins or other binary operations
- CQL CRUD operations are executed with a tunable consistency level
- CQL supports lightweight transactions but not ACID transactions

If some of the above facts do not sound familiar, you know that there are more about CQL to learn! 

