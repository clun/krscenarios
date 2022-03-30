This scenario requires a two-node cluster, that is being created for you, which
may take about three minutes.
Wait until the terminal prints a message such as "_Cassandra Cluster with nodes_
`<IP_node_1>` _and_ `<IP_node_2>` _has started_" before proceeding.

Verify the cluster is up and running with
```
nodetool status
```{{execute T1}}
The output should list _two_ nodes, each in the `UN` (Up, Normal) status.

### Initialization

Let us initialize all terminals of the scenario (including connecting to the
  two nodes) by running the following:
```
echo Initializing terminal 2
ssh $HOST1_IP
```{{execute T2}}

```
echo Initializing terminal 3
ssh $HOST1_IP
```{{execute T3}}

```
echo Initializing terminal 4
ssh $HOST1_IP
```{{execute T4}}

```
echo Initializing terminal 5
ssh $HOST2_IP
```{{execute T5}}

```
echo Initializing terminal 6
ssh $HOST2_IP
```{{execute T6}}

```
echo Initializing terminal 7
ssh $HOST2_IP
```{{execute T7}}


### Schema creation

Open the CQL Shell on both nodes:

```
cqlsh $HOST1_IP    # Node1
```{{execute T4}}


```
cqlsh $HOST2_IP    # Node2
```{{execute T7}}

The following commands can be run on either CQL shells - we will work
on Node1. First let us create a keyspace with replication factor of two,
i.e. such that _all rows_ be replicated on _both nodes_:
```
CREATE KEYSPACE chemistry WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor': 2};
```{{execute T4}}

Set the newly-created keyspace as the default one for subsequent commands:
```
USE chemistry;
```{{execute T4}}

Finally create a table for storing the periodic table of elements:
```
CREATE TABLE elements (
    symbol TEXT PRIMARY KEY,
    name TEXT,
    atomic_mass DOUBLE,
    atomic_number INT
);
```{{execute T4}}

### Data insertion

A CSV file with the first hundred or so elements and their properties is
provided for use; to load its contents into the `elements` table, run the
following CQL command:
```
COPY elements FROM 'elements.csv' WITH HEADER=TRUE;
```{{execute T4}}

To verify the insertion has succeeded, let's try to query the table (from
  Node2, why not?). Let's look at some of the rows,
```
USE chemistry;
SELECT * FROM elements LIMIT 10;
```{{execute T7}}

and then count how many are there:

```
SELECT COUNT(*) FROM elements;
```{{execute T7}}

### Recap

We have created a table and inserted about a hundred rows in it;
the table is replicated, in its entirety, on each of the two nodes
that form the cluster.
