If your `insertGame` tests ran successfully, you will have a new game record in the database.

We can use cURL to verify the document exists.

```
curl --request GET \
https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/rest/v2/namespaces/$ASTRA_DB_KEYSPACE/collections/games?page-size=20 \
--header "x-cassandra-token: $ASTRA_DB_APPLICATION_TOKEN" | jq
```{{execute}}


---

<p><span style="color:teal">***Note:***</span> *If you run the test several times, you will see several documents in the results.*</p>

---

## Fantastic Work!
