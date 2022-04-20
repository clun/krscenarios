Find information about all data sources in group `House A`:

<details>
  <summary>Solution</summary>

```sql
SELECT group, source, description, 
       characteristics['Model number'] 
FROM sources_by_group
WHERE group = 'House A';
```{{execute}}

</details>

