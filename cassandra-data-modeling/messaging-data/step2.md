Create table `folders_by_user`:
```sql
CREATE TABLE folders_by_user (
  username TEXT,
  label TEXT,
  color TEXT,
  PRIMARY KEY ((username),label)
);
```{{execute}}

Create table `unread_email_stats`:
```sql
CREATE TABLE unread_email_stats (
  username TEXT,
  label TEXT,
  num_unread COUNTER,
  PRIMARY KEY ((username),label)
);
```{{execute}}

Create table `emails_by_user_folder`:
```sql
CREATE TABLE emails_by_user_folder (
  username TEXT,
  label TEXT,
  id TIMEUUID,
  "from" TEXT,
  subject TEXT,
  is_read BOOLEAN,
  PRIMARY KEY ((username,label),id)
) WITH CLUSTERING ORDER BY (id DESC);
```{{execute}}

Create table `emails`:
```sql
CREATE TABLE emails (
  id TIMEUUID,
  "to" LIST<TEXT>,
  "from" TEXT,
  subject TEXT,
  body TEXT,
  attachments MAP<TEXT,INT>,
  PRIMARY KEY ((id))
);
```{{execute}}

Create table `attachments`:
```sql
CREATE TABLE attachments (
  email_id TIMEUUID,
  filename TEXT,
  chunk_number INT,
  type TEXT,
  value BLOB,
  PRIMARY KEY ((email_id,filename,chunk_number))
);
```{{execute}}