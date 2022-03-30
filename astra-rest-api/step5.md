How about updating the record?
Let's look at an example where we update the price of a product.

We use the same URL endpoint we used in the read
<br>

<details>
  <summary style="color:teal"><b>What does the JSON data look like?</b></summary>
  <hr>
  The update data looks like a subset of the data used to create the record.
  If we want to update the price, we might use this.
  <br>
  ```
  {
    "price": "9999.99"
  }
  ```
  <br>
  <hr>
</details>

Here's the cURL request. Give it a try.

```
curl --request PUT \
    https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/rest/v2/keyspaces/$ASTRA_DB_KEYSPACE/products/e9b6c02d-0604-4bab-a3ea-6a7984654631 \
    --header 'content-type: application/json' \
    --header "x-cassandra-token: $ASTRA_DB_APPLICATION_TOKEN" \
    -d '{"price": "9999.99"}' | jq
```{{execute}}

Now, check out the results by doing a query.

```
curl --request GET \
    https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/rest/v2/keyspaces/$ASTRA_DB_KEYSPACE/products/e9b6c02d-0604-4bab-a3ea-6a7984654631 \
    --header "x-cassandra-token: ${ASTRA_DB_APPLICATION_TOKEN}" \
    | jq
```{{execute}}

---

<p><span  style="color:teal">***NOTE:***</span> *Updates are upserts. If the row doesn’t exist, the update will create it. If the row does exist, the update will change the row with the new row data.*</p>

---



## Huh! Updates are easy too!
