Find daily min, max, median, mean and standard deviation values for 
a time series with source `Termostate A2`, metric `humidity` and 
date range [`2019-12-25`,`2020-01-07`]; order by date (desc):

<details>
  <summary>Solution</summary>

```sql
SELECT * 
FROM time_series.statistics_by_source_metric
WHERE source = 'Termostate A2'
  AND metric = 'humidity'
  AND date >= '2019-12-25'
  AND date <= '2020-01-07';
```{{execute}}

</details>