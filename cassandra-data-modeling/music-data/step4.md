Start the CQL shell:
```
cqlsh -k music_data
```{{execute}}

Insert rows into table `users`:

```
INSERT INTO users (id, name)
VALUES (12345678-aaaa-bbbb-cccc-123456789abc, 'Joe'); 
INSERT INTO users (id, name)
VALUES (UUID(), 'Jen'); 
INSERT INTO users (id, name)
VALUES (UUID(), 'Jim'); 

SELECT * FROM users;
```{{execute}}

Insert rows into table `tracks_by_user`:

```
INSERT INTO tracks_by_user (id, month, timestamp, album_title, album_year, number, title)
VALUES (12345678-aaaa-bbbb-cccc-123456789abc, '2020-01-01', '2020-01-05T11:22:33', '20 Greatest Hits', 1982, 16, 'Hey Jude');

INSERT INTO tracks_by_user (id, month, timestamp, album_title, album_year, number, title)
VALUES (12345678-aaaa-bbbb-cccc-123456789abc, '2020-09-01', '2020-09-15T09:00:00', '20 Greatest Hits', 1982, 16, 'Hey Jude');

INSERT INTO tracks_by_user (id, month, timestamp, album_title, album_year, number, title)
VALUES (12345678-aaaa-bbbb-cccc-123456789abc, '2020-09-01', '2020-09-15T16:41:10', 'Legendary Concert Performances', 1978, 6, 'Johnny B. Goode');

INSERT INTO tracks_by_user (id, month, timestamp, album_title, album_year, number, title)
VALUES (12345678-aaaa-bbbb-cccc-123456789abc, '2020-09-01', '2020-09-15T16:44:56', 'The Beatles 1967-1970', 1973, 17, 'Come Together');

INSERT INTO tracks_by_user (id, month, timestamp, album_title, album_year, number, title)
VALUES (12345678-aaaa-bbbb-cccc-123456789abc, '2020-09-01', '2020-09-15T21:13:13', 'Dark Side Of The Moon', 1973, 3, 'Time');

SELECT * FROM tracks_by_user;
```{{execute}}
