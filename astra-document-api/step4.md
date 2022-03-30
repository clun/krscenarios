Suppose we are curious about a specific aspect of our game, like the questions asked in the different rounds.
We can retrieve a *subdocument* from our game document, by providing the `document-path`.

For example, this URI specifies the `questions` subdocument from games document 1.

```
https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/rest/v2/namespaces/$ASTRA_DB_KEYSPACE/collections/games/1/questions
```

Use a GET request for the URI above to retrieve the `questions` subdocument.

```
curl --request  GET \
https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/rest/v2/namespaces/$ASTRA_DB_KEYSPACE/collections/games/1/questions \
--header "x-cassandra-token: $ASTRA_DB_APPLICATION_TOKEN" | jq
```{{execute}}


expected output:
```
{
  "documentId": "1",
  "data": {
    "1": {
      "content": "What time is it?",
      "roundId": 1
    },
    "2": {
      "content": "What day is it?",
      "roundId": 2
    },
    "3": {
      "content": "https://xkcd.com/386/",
      "roundId": 3
    }
  }
}
```

## Nice! You have just requested a subdocument from the games collection.
