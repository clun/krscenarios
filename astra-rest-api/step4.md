
Now that we have a record in the database, let's retrieve it.

<details>
  <summary style="color:teal"><b>What is the Astra DB URL endpoint for reading a record?</b></summary>
  <hr>

We use the same URL we used to create the record, except we also append the record's ID, which is the primary key in the table.

The end of the URL, will look something like this.
```/v2/keyspaces/betterbotz/products/e9b6c02d-0604-4bab-a3ea-6a7984654631```
  <hr>
</details>


Here's the cURL command. Give it a try and check out the results!

```
curl --request GET \
    https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/rest/v2/keyspaces/$ASTRA_DB_KEYSPACE/products/e9b6c02d-0604-4bab-a3ea-6a7984654631 \
    --header "x-cassandra-token: $ASTRA_DB_APPLICATION_TOKEN" \
    | jq
```{{execute}}

---

<p><span style="color:teal">***Note:***</span> *_jq_ (at the end of the command) is a pretty printer for JSON. We piped the results of the query into _jq_ to make them a little easier to read.*</p>

---

## Amazing! Astra cURL requests are that easy!
