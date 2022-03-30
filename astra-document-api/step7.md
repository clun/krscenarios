Finally, when we don't need our game document any more, we can easily delete it using a cURL command.

```
curl --request DELETE \
https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/rest/v2/namespaces/$ASTRA_DB_KEYSPACE/collections/games/1 \
--header "x-cassandra-token: $ASTRA_DB_APPLICATION_TOKEN"
```{{execute}}

## Fantastic Work!
