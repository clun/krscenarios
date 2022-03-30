Let's use our newly connected CQL shell by
- Setting `user_management` as the default keyspace
- Creating a table named `users` we can work with

Set the default keyspace to `user_management`.

<details>
  <summary style="color:teal">Solution</summary>

`// Set user_management as the default keyspace
USE user_management;`{{execute}}

</details>

Now, let's create a table named `users` as follows.
- Four text columns: `last_name`, `first_name`, `email` and `address`
- The partition key is the `last_name` column
- The `first_name` and `email` columns are clustering columns
- The `address` column is a payload column - payload columns just go along for the ride

<details>
  <summary style="color:teal">Solution</summary>

`// Create the example users table
CREATE TABLE IF NOT EXISTS users (
  last_name   text,
  first_name  text,
  email       text,
  address     text,
  PRIMARY KEY((last_name), first_name, email)
);`{{execute}}

</details>

<details>
  <summary style="color:teal"><b>Why did we chose these columns for the primary key?</b></summary>

  <p style="color:teal"><i>We designed this table to support a query for all users with the same last name. So, we chose `last_name` as the partition key.
  We want the results of these queries to be in alphabetical order, so we used `first_name` as a clustering column.
  It is possible that two different people could have the same first and last name. We need the rows for these two people to be different, so we added the `email` column as a clustering column to make each row unique.</i></p>

</details>


Just to make sure we created the table correctly, let's describe and review the keyspace.

`DESCRIBE KEYSPACE user_management`{{execute}}

If everything looks good, then you're good to go!
<br>
## Great! You know how to create an Astra DB table using CQL!
