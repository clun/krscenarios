Execute the CQL script to insert sample data:
```
SOURCE '~/sensor_data.cql'
```{{execute}}

Retrieve all rows from table `networks`:
```
SELECT * FROM networks;        
```{{execute}}

Retrieve all rows from table `temperatures_by_network`:
```
SELECT network, week, date_hour, 
       sensor, avg_temperature 
FROM temperatures_by_network;
```{{execute}}

Retrieve all rows from table `sensors_by_network`:
```   
SELECT * FROM sensors_by_network;                    
```{{execute}}

Retrieve all rows from table `temperatures_by_sensor`:
```
SELECT * FROM temperatures_by_sensor; 
```{{execute}}
