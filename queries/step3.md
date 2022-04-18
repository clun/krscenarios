Start the CQL shell:
```
cqlsh
```{{execute}}

Create the keyspace:
```
CREATE KEYSPACE killr_video
WITH replication = {
  'class': 'NetworkTopologyStrategy', 
  'DC-Houston': 1 };
```{{execute}}

Create and populate the tables:
```
USE killr_video;

CREATE TABLE users (
  email TEXT,
  name TEXT,
  age INT,
  date_joined DATE,
  PRIMARY KEY ((email))
);
INSERT INTO users (email, name, age, date_joined) 
VALUES ('joe@datastax.com', 'Joe', 25, '2020-01-01');
INSERT INTO users (email, name, age, date_joined) 
VALUES ('jen@datastax.com', 'Jen', 27, '2020-01-01');
INSERT INTO users (email, name, age, date_joined) 
VALUES ('jim@datastax.com', 'Jim', 31, '2020-05-07');

CREATE TABLE movies (
  title TEXT,
  year INT,
  duration INT,
  avg_rating FLOAT,
  PRIMARY KEY ((title, year))
);
INSERT INTO movies (title, year, duration, avg_rating) 
VALUES ('Alice in Wonderland', 2010, 108, 8.33);
INSERT INTO movies (title, year, duration, avg_rating) 
VALUES ('Alice in Wonderland', 1951, 75, 6.5);
INSERT INTO movies (title, year, duration, avg_rating) 
VALUES ('Edward Scissorhands', 1990, 98, 8.5);

CREATE TABLE ratings_by_user (
  email TEXT,
  title TEXT,
  year INT,
  rating INT,
  PRIMARY KEY ((email), title, year)
) WITH CLUSTERING ORDER BY (title ASC, year DESC);
INSERT INTO ratings_by_user (email, title, year, rating) 
VALUES ('joe@datastax.com', 'Alice in Wonderland', 2010, 9);
INSERT INTO ratings_by_user (email, title, year, rating)  
VALUES ('joe@datastax.com', 'Edward Scissorhands', 1990, 10);
INSERT INTO ratings_by_user (email, title, year, rating) 
VALUES ('jen@datastax.com', 'Alice in Wonderland', 2010, 10);
INSERT INTO ratings_by_user (email, title, year, rating)  
VALUES ('jen@datastax.com', 'Alice in Wonderland', 1951, 8);
INSERT INTO ratings_by_user (email, title, year, rating) 
VALUES ('jim@datastax.com', 'Alice in Wonderland', 2010, 6);
INSERT INTO ratings_by_user (email, title, year, rating)  
VALUES ('jim@datastax.com', 'Edward Scissorhands', 1990, 7);
INSERT INTO ratings_by_user (email, title, year, rating)  
VALUES ('jim@datastax.com', 'Alice in Wonderland', 1951, 5);

CREATE TABLE ratings_by_movie (
  title TEXT,
  year INT,
  email TEXT,
  rating INT,
  PRIMARY KEY ((title, year), email)
);
INSERT INTO ratings_by_movie (email, title, year, rating) 
VALUES ('joe@datastax.com', 'Alice in Wonderland', 2010, 9);
INSERT INTO ratings_by_movie (email, title, year, rating)  
VALUES ('joe@datastax.com', 'Edward Scissorhands', 1990, 10);
INSERT INTO ratings_by_movie (email, title, year, rating) 
VALUES ('jen@datastax.com', 'Alice in Wonderland', 2010, 10);
INSERT INTO ratings_by_movie (email, title, year, rating)  
VALUES ('jen@datastax.com', 'Alice in Wonderland', 1951, 8);
INSERT INTO ratings_by_movie (email, title, year, rating) 
VALUES ('jim@datastax.com', 'Alice in Wonderland', 2010, 6);
INSERT INTO ratings_by_movie (email, title, year, rating)  
VALUES ('jim@datastax.com', 'Edward Scissorhands', 1990, 7);
INSERT INTO ratings_by_movie (email, title, year, rating)  
VALUES ('jim@datastax.com', 'Alice in Wonderland', 1951, 5);
```{{execute}}


