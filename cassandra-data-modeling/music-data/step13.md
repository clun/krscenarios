Find all tracks played by a user in `September 2020`; order by timestamp (desc):

<details>
  <summary>Solution</summary>
```
SELECT timestamp, album_title, album_year, number, title
FROM tracks_by_user
WHERE id = 12345678-aaaa-bbbb-cccc-123456789abc 
  AND month = '2020-09-01';
```{{execute}}
</details>
