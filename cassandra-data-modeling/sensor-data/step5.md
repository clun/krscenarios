Find hourly average temperatures for every sensor in network `forest-net` and date range [`2020-07-05`,`2020-07-06`] within the week of `2020-07-05`; 
order by date (desc) and hour (desc):

<details>
  <summary>Solution</summary>

```sql
SELECT date_hour, avg_temperature, 
       latitude, longitude, sensor 
FROM temperatures_by_network
WHERE network    = 'forest-net'
  AND week       = '2020-07-05'
  AND date_hour >= '2020-07-05'
  AND date_hour  < '2020-07-07';
```{{execute}}

</details>

<br/>

Find hourly average temperatures for every sensor in network `forest-net` and date range [`2020-07-04`,`2020-07-06`] within the weeks of `2020-06-28` and `2020-07-05`; 
order by date (desc) and hour (desc):

<details>
  <summary>Solution 1</summary>

```sql
SELECT date_hour, avg_temperature, 
       latitude, longitude, sensor 
FROM temperatures_by_network
WHERE network    = 'forest-net'
  AND week       = '2020-07-05'
  AND date_hour >= '2020-07-04'
  AND date_hour  < '2020-07-07';
  
SELECT date_hour, avg_temperature, 
       latitude, longitude, sensor 
FROM temperatures_by_network
WHERE network    = 'forest-net'
  AND week       = '2020-06-28'
  AND date_hour >= '2020-07-04'
  AND date_hour  < '2020-07-07';  
```{{execute}}

</details>

<details>
  <summary>Solution 2</summary>

```sql
SELECT date_hour, avg_temperature, 
       latitude, longitude, sensor 
FROM temperatures_by_network
WHERE network    = 'forest-net'
  AND week      IN ('2020-07-05','2020-06-28')
  AND date_hour >= '2020-07-04'
  AND date_hour  < '2020-07-07';  
```{{execute}}

</details>