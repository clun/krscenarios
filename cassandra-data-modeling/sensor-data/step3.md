Execute the CQL script to insert sample data:
```sql
SOURCE '~/sensor_data.cql'
```{{execute}}

Retrieve all rows from table `networks`:
```sql
SELECT * FROM networks;        
```{{execute}}

Retrieve all rows from table `temperatures_by_network`:
```sql
SELECT network, week, date_hour, 
       sensor, avg_temperature 
FROM temperatures_by_network;
```{{execute}}

Retrieve all rows from table `sensors_by_network`:
```sql
SELECT * FROM sensors_by_network;                    
```{{execute}}

Retrieve all rows from table `temperatures_by_sensor`:
```sql
SELECT * FROM temperatures_by_sensor; 
```{{execute}}
