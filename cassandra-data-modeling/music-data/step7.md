Find an album with title `Magical Mystery Tour` and year `1967`:

<details>
  <summary>Solution</summary>

```sql
SELECT *
FROM albums_by_title
WHERE title = 'Magical Mystery Tour'
  AND year  = 1967;
```{{execute}}

</details>
