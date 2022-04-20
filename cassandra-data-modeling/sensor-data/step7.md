Find raw measurements for sensor `s1003` on `2020-07-06`; order by timestamp (desc):

<details>
  <summary>Solution</summary>

```sql
SELECT timestamp, value 
FROM temperatures_by_sensor
WHERE sensor = 's1003'
  AND date   = '2020-07-06';
```{{execute}}

</details>