In this step, you will create a keyspace and a table and populate them with some data.

Click to start a CQL shell (cqlsh) to execute CQL commands in the cluster.
```
cqlsh
```{{execute T1}}

Create a keyspace.
```
CREATE KEYSPACE united_states WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};
```{{execute T1}}

Use the keyspace.
```
USE united_states;
```{{execute T1}}

Create the table.
```
CREATE TABLE cities_by_state(
    state text,
    name text,
    population int,
    PRIMARY KEY((state), name)
);
```{{execute T1}}

Insert the top 10 (by population) cities in the United States.
```
INSERT INTO cities_by_state (state, name, population) 
  VALUES ('New York','New York City',8622357);
INSERT INTO cities_by_state (state, name, population) 
  VALUES ('California','Los Angeles',4085014);
INSERT INTO cities_by_state (state, name, population) 
  VALUES ('Illinois','Chicago',2670406);
INSERT INTO cities_by_state (state, name, population) 
  VALUES ('Texas','Houston',2378146);
INSERT INTO cities_by_state (state, name, population) 
  VALUES ('Arizona','Phoenix',1743469);
INSERT INTO cities_by_state (state, name, population) 
  VALUES ('Pennsylvania','Philadelphia',1590402);
INSERT INTO cities_by_state (state, name, population) 
  VALUES ('Texas','San Antonio',1579504);
INSERT INTO cities_by_state (state, name, population) 
  VALUES ('California','San Diego',1469490);
INSERT INTO cities_by_state (state, name, population) 
  VALUES ('Texas','Dallas',1400337);
INSERT INTO cities_by_state (state, name, population) 
  VALUES ('California','San Jose',1036242);
```{{execute T1}}

Verify that the data has been loaded.
```
SELECT * FROM cities_by_state;
```{{execute T1}}

Retrieve all the cities in California.
```
SELECT * FROM cities_by_state WHERE state = 'California';
```{{execute T1}}

Exit the CQL shell and clear the screen.
```
exit
clear
```{{execute T1}}

You have loaded the data, continue to the next step.