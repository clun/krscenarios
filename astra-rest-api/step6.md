Finally, we can delete the row from the table.
<br>

<details>
  <summary style="color:teal"><b>What does a DELETE cURL command look like?</b></summary>
  <hr>
This cURL request looks a lot like a query, with the same URL.
However, we use the `DELETE` REST verb and we add the `content-type` header.
  <hr>
</details>

Here's the cURL request. Give it a try.

```
curl --request DELETE \
    https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/rest/v2/keyspaces/$ASTRA_DB_KEYSPACE/products/e9b6c02d-0604-4bab-a3ea-6a7984654631 \
    --header "x-cassandra-token: $ASTRA_DB_APPLICATION_TOKEN"
```{{execute}}

Now, try the query again to make sure the record is gone.


```
curl --request GET \
    https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/rest/v2/keyspaces/$ASTRA_DB_KEYSPACE/products/e9b6c02d-0604-4bab-a3ea-6a7984654631 \
    --header "x-cassandra-token: $ASTRA_DB_APPLICATION_TOKEN" \
    | jq
```{{execute}}

If you want to clean-up and delete the entire table, you can use the _Schemas_ API ([Schemas API docs](https://docs.datastax.com/en/astra/docs/_attachments/restv2.html#tag/Schemas)).
Here's the command.

```
curl --request DELETE \
    https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/rest/v2/schemas/keyspaces/$ASTRA_DB_KEYSPACE/tables/products \
    --header "x-cassandra-token: $ASTRA_DB_APPLICATION_TOKEN"
```{{execute}}

## That's it! Now, you've seen all four CRUD operations!
