Find information about all networks; order by name (asc):

<details>
  <summary>Solution</summary>

```sql
SELECT name, description,
       region, num_sensors
FROM networks
WHERE bucket = 'all';
```{{execute}}

</details>