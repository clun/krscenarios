Find information about all metrics stored in bucket `all`; order by metric name (asc):

<details>
  <summary>Solution</summary>
```
SELECT * 
FROM time_series.metrics
WHERE bucket = 'all';
```{{execute}}
</details>

