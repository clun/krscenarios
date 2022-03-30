How about updating a record?
Herman Melville's birth name was Melvill.
Let's update the record for _Moby Dick_ to have the _author_ value of _Herman Melvill_ - his birth name.
<br>

<details>
  <summary style="color:teal"><b>What does the JSON look like?</b></summary>
  <hr>
As you will see, the update command looks like the insert command, except we add an `ifExists` parameter to the `updateBooks` verb.
When dealing with Cassandra, an insert and an update _really are_ the same thing because Cassandra does not do a read before writing - that wouldn't scale very well.
But, sometimes we may want to force Cassandra to read before writing.
In this case, we can use light-weight transactions like `ifExists`.

Let's look at an example.
Here's the JSON.

```
mutation updateABook {
  moby: updateBooks(
    value: { title: "Moby Dick", author: "Herman Melvill" }
    options: { consistency: LOCAL_QUORUM }
    ifExists: true
  ) {
    value {
      title
      author
    }
  }
}
```
<hr>
</details>

Here's the cURL request.
Give it a try!

```
curl "https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/graphql/$ASTRA_DB_KEYSPACE" \
    --header "Content-Type: application/json" \
    --header "x-cassandra-token: $ASTRA_DB_APPLICATION_TOKEN" \
    --data '{"query":"mutation updateABook {moby: updatebooks(value: {title: \"Moby Dick\", author: \"Herman Melvill\"} options: { consistency: LOCAL_QUORUM } ifExists: true) {value {title author}}}"}' --compressed | jq
```{{execute}}


Query the record to see the update.

```
curl "https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/graphql/$ASTRA_DB_KEYSPACE" \
    --header "Content-Type: application/json" \
    --header "x-cassandra-token: $ASTRA_DB_APPLICATION_TOKEN" \
    --data '{"query":"query oneBook {books(value: {title: \"Moby Dick\" }) {values {title author}}}"}' --compressed | jq
```{{execute}}


## GraphQL is absolutely wonderful!
