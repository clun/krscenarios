Before we start inserting records, we will make sure we have the consistency level set to `LOCAL_QUORUM`.

```
CONSISTENCY LOCAL_QUORUM
```{{execute}}

Let's put a row in the table with the following values:

| Column Name | Value           |
|:-----------:|:---------------:|
|last_name    |Smith            |
|first_name   |Alex             |
|email        |asmith@gmail.com |
|address      |123 Main st.     |

<details>
  <summary style="color:teal">Solution</summary>

`INSERT INTO users
  (last_name, first_name, email, address)
  VALUES(
    'Smith',
    'Alex',
    'asmith@gmail.com',
    '123 Main st.');`{{execute}}

</details>

To see the results of the statement, let's retrieve all the rows in the table:

`SELECT * FROM users;`{{execute}}

---

<p><span  style="color:teal">***NOTE:***</span> *The previous unconstrained query requires a full table scan. We would not advise using this type of query on production databases because these queries can impact performance. However, for educational purposes on small tables, it's OK.*</p>

---

You see the row you created.
Now that you've seen the `INSERT` command, try it out. Insert a row with the following values:

| Column Name | Value           |
|:-----------:|:---------------:|
|last_name    |Smith            |
|first_name   |Bailey           |
|email        |bsmith@gmail.com |
|address      |234 Elm st.      |

<details>
  <summary style="color:teal">Solution</summary>

`INSERT INTO users
  (last_name, first_name, email, address)
  VALUES(
    'Smith',
    'Bailey',
    'bsmith@gmail.com',
    '234 Elm st.');`{{execute}}

</details>

Retrieve all the rows from the `users` table to verify your insert worked as expected.

`SELECT * FROM users;`{{execute}}

---

<p><span  style="color:green">***ProTip:***</span> *You can use the tab key for command completion and to show you command options. Also, you can scroll through the cqlsh command history using the up/down arrow keys.*</p>

---

Let's throw in one more row just for good measure.
Notice this row has no `address` column value.
Remember, Cassandra supports sparse column values with no overhead.

`INSERT INTO users
  (last_name, first_name, email)
  VALUES(
    'Jones',
    'Chris',
    'cjones@gmail.com');`{{execute}}


## Superb! You see how to insert rows into your Astra DB table!
