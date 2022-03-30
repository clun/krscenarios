Finally, we can delete a row from the table.
This cURL request looks a lot like a query, with the same URL, except here again we will use the `ifExists` flag and the `deleteBooks` verb.
<br>

<details>
  <summary style="color:teal"><b>What does the JSON look like?</b></summary>
  <hr>
```
mutation deleteABook {
  PaP: deleteBooks(
    value: { title: "Moby Dick" }
    options: { consistency: LOCAL_QUORUM }
    ifExists: true
  ) {
    value {
      title
    }
  }
}
```
<hr>
</details>

Give it a try!

```
curl "https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/graphql/$ASTRA_DB_KEYSPACE" \
    --header "Content-Type: application/json" \
    --header "x-cassandra-token: $ASTRA_DB_APPLICATION_TOKEN" \
    --data-binary '{"query":"mutation deleteABook {PaP: deletebooks(value: {title: \"Moby Dick\"} options: {consistency: LOCAL_QUORUM} ifExists: true) {value {title}}}"}' --compressed | jq
```{{execute}}

Query the record to see that it is deleted.

```
curl "https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/graphql/$ASTRA_DB_KEYSPACE" \
    --header "Content-Type: application/json" \
    --header "x-cassandra-token: $ASTRA_DB_APPLICATION_TOKEN" \
    --data '{"query":"query oneBook {books(value: {title: \"Moby Dick\" }) {values {title author}}}"}' --compressed | jq
```{{execute}}

If you want to clean-up and delete the both tables, you can use the _Schemas_ API ([Schemas API docs](https://docs.datastax.com/en/astra/docs/_attachments/restv2.html#tag/Schemas)).
Here are the commands.

```
curl --request DELETE \
    https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/rest/v2/schemas/keyspaces/$ASTRA_DB_KEYSPACE/tables/authors \
    --header "x-cassandra-token: $ASTRA_DB_APPLICATION_TOKEN"
curl --request DELETE \
    https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/rest/v2/schemas/keyspaces/$ASTRA_DB_KEYSPACE/tables/books \
    --header "x-cassandra-token: $ASTRA_DB_APPLICATION_TOKEN"
```{{execute}}


So, you've seen all four CRUD operations.

## That's all there is to it!
