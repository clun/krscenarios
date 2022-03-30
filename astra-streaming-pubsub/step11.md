The Astra DB sink connector we set up has collected the events to the Astra DB table.
Let's query the table to see the events.

```
curl --request GET \
    https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/rest/v2/keyspaces/$ASTRA_DB_KEYSPACE/temperatures_by_timestamp/rows \
    --header "x-cassandra-token: $ASTRA_DB_APPLICATION_TOKEN" \
    | jq
```{{execute T1}}

We see that all the events were sinked to our Astra DB table.

## Congrats! It's that easy to sink Astra Streaming events to Astra DB.
