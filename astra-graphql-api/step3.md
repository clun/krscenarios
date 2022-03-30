Let's use another cURL command and the GraphQL API to add rows to the tables.

<details>
  <summary style="color:teal"><b>What is the Astra DB URL endpoint for adding a record?</b></summary>
  <hr>
To create the endpoint URL, we start with the same base URL that we used when we created the table, but we change the end of the URL to specify the keyspace.

The complete URL should look something like this.

```
https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/graphql/$ASTRA_DB_KEYSPACE
```
<hr>
</details>

We'll use the same cURL headers to those we used when we created the table.

<details>
  <summary style="color:teal"><b>What are the headers for this command?</b></summary>
  <hr>
```
--header 'Content-Type: application/json'
--header 'x-cassandra-token: $ASTRA_DB_APPLICATION_TOKEN'
```
<hr>
</details>

<details>
  <summary style="color:teal"><b>What is the JSON for the command?</b></summary>
  <hr>
We'll add two rows - one for the book _Moby Dick_ and one for the book _Catch-22_.
The JSON looks like this.

```
mutation {
  moby: insertBooks(
    value: { title: "Moby Dick", author: "Herman Mellville" }
    options: { consistency: LOCAL_QUORUM }
  ) {
    value {
      title
    }
  }
  catch22: insertBooks(
    value: { title: "Catch-22", author: "Joseph Heller" }
    options: { consistency: LOCAL_QUORUM }
  ) {
    value {
      title
    }
  }
}
```
<hr>
</details>

Here's the command.
Give it a try!

```
curl "https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/graphql/$ASTRA_DB_KEYSPACE" \
    --header "Content-Type: application/json" \
    --header "x-cassandra-token: $ASTRA_DB_APPLICATION_TOKEN" \
    --data '{"query":"mutation insert2Books {moby: insertbooks(value: {title: \"Moby Dick\", author: \"Herman Mellville\"} options: { consistency: LOCAL_QUORUM }) {value {title\n    }} catch22: insertbooks(value: { title: \"Catch-22\", author: \"Joseph Heller\" } options: { consistency: LOCAL_QUORUM }) {value {title}}}"}' --compressed | jq
```{{execute}}


## We have records in the table!
