Find tracks from album `Magical Mystery Tour` of `1967`; order by track number (asc):

<details>
  <summary>Solution</summary>
```
SELECT *
FROM tracks_by_album
WHERE album_title = 'Magical Mystery Tour'
  AND album_year  = 1967; 
```{{execute}}
</details>
