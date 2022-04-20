Create tables `performers`, `albums_by_performer`, `albums_by_title`, 
`albums_by_genre`, `tracks_by_title`, `tracks_by_album`, `users` and `tracks_by_user`:
```sql
cqlsh -e "

USE music_data;

CREATE TABLE performers (
  name TEXT,
  type TEXT,
  country TEXT,
  born INT,
  died INT,
  founded INT,
  PRIMARY KEY ((name))
);

CREATE TABLE albums_by_performer (
  performer TEXT,
  year INT,
  title TEXT,
  genre TEXT,
  PRIMARY KEY ((performer),year,title)
) WITH CLUSTERING ORDER BY (year DESC, title ASC);

CREATE TABLE albums_by_title (
  title TEXT,
  year INT,
  performer TEXT,
  genre TEXT,
  PRIMARY KEY ((title),year)
) WITH CLUSTERING ORDER BY (year DESC);

CREATE TABLE albums_by_genre (
  genre TEXT,
  year INT,
  title TEXT,
  performer TEXT,
  PRIMARY KEY ((genre),year,title)
) WITH CLUSTERING ORDER BY (year DESC, title ASC);

CREATE TABLE tracks_by_title (
  title TEXT,
  album_year INT,
  album_title TEXT,
  number INT,
  length INT,
  genre TEXT,
  PRIMARY KEY ((title),album_year,album_title,number)
) WITH CLUSTERING ORDER BY (album_year DESC, album_title ASC, number ASC);

CREATE TABLE tracks_by_album (
  album_title TEXT,
  album_year INT,
  number INT,
  title TEXT,
  length INT,
  genre TEXT STATIC,
  PRIMARY KEY ((album_title,album_year),number)
);

CREATE TABLE users (
  id UUID,
  name TEXT,
  PRIMARY KEY ((id))
);

CREATE TABLE tracks_by_user (
  id UUID,
  month DATE,
  timestamp TIMESTAMP,
  album_title TEXT,
  album_year INT,
  number INT,
  title TEXT,
  length INT,
  PRIMARY KEY ((id,month),timestamp,album_title,album_year,number)
) WITH CLUSTERING ORDER BY (timestamp DESC, album_title ASC, album_year ASC, number ASC);"
```{{execute}}