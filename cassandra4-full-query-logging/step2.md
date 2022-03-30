In this step, you will connect using *cqlsh* and create a keyspace and table, perform some queries, and verify that full query logs are being created

Start the CQL Shell (*cqlsh*) so you can issue CQL commands.

```
cqlsh
```{{execute}}

Create the `movies` keyspace.

```
create KEYSPACE movies WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};
```{{execute}}

Use the `movies` keyspace.

```
use movies;
```{{execute}}

Create the `movie_metadata` table.

```
CREATE TABLE movie_metadata(
  imdb_id        text,
  overview       text,
  release_date   text,
  title          text,
  average_rating float,
  PRIMARY KEY(imdb_id));
```{{execute}}

Insert a row into the *movie_metadata* table.
```
INSERT INTO movie_metadata (
  imdb_id, overview, release_date, title, average_rating
) VALUES('tt0114709', 'Led by Woody, Andy''s toys live happily in his room until Andy''s birthday brings Buzz Lightyear onto the scene. Afraid of losing his place in Andy''s heart, Woody plots against Buzz. But when circumstances separate Buzz and Woody from their owner, the duo eventually learns to put aside their differences.', '10/30/95', 'Toy Story', 7.7);
```{{execute}}

Now let's do a `SELECT`

```
SELECT * FROM movie_metadata WHERE imdb_id = 'tt0114709';
```{{execute}}

You should see the row you just inserted.

Type `exit` to close *cqlsh*.
```
exit
```{{execute}}

Now, let's check the contents of our log directory to see if anything has been created:

```
ls /tmp/fqllogs
```{{execute}}

You'll see two files, a file with a date timestamp in the name, and another file which provides a directory of all the dated files that have been written. You can try opening these files if you wish, but the contents won't make a lot of sense since they are binary data. Don't worry, Cassandra has a way to read this data.

# Summary

In this step, you have created the *movies* keyspace and the *movie_metadata* table, and performed some queries, and verified that full query logs were created.