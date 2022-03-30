Now that we have records in the database, let's retrieve one.
To do this, we submit a request to the same URL, using the same headers, we used to create the record.

<details>
  <summary style="color:teal"><b>What does the JSON look like to retrieve _Moby Dick_?</b></summary>
  <hr>
```
query oneBook {
  books(value: { title: "Moby Dick" }) {
    values {
      title
      author
    }
  }
}
```
<hr>
</details>

Here's the cURL request.
Give it a try and check out the results!

```
curl "https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/graphql/$ASTRA_DB_KEYSPACE" \
    --header "Content-Type: application/json" \
    --header "x-cassandra-token: $ASTRA_DB_APPLICATION_TOKEN" \
    --data '{"query":"query oneBook {books(value: {title: \"Moby Dick\" }) {values {title author}}}"}' --compressed | jq
```{{execute}}


## Astra DB GraphQL cURL requests are that easy!
