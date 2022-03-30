Let's verify we inserted document `1` in our games collection by retrieving it.

We can submit a request to the same URI we used to create the document.
Except, this time we'll use an HTTP `GET` request.
We will pipe the returned data into `jq` to make it easier to read.


```
curl --request GET \
https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/rest/v2/namespaces/$ASTRA_DB_KEYSPACE/collections/games/1 \
--header "x-cassandra-token: $ASTRA_DB_APPLICATION_TOKEN" | jq
```{{execute}}

This should return the document we had inserted just a moment ago:

```
{
  "documentId": "1",
  "data": {
    "answers": {},
    "audienceSize": 0,
    "audienceVotes": {},
    "currentState": {
      "name": "ADD_PLAYERS",
      "roundId": null
    },
    "gameCode": "DANG",
    "players": {},
    "questions": {
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
    },
    "rounds": {
      "1": {
        "scoreMultiplier": 1,
        "title": "Round 1",
        "type": "QUESTION"
      },
      "2": {
        "scoreMultiplier": 2,
        "title": "Round 1",
        "type": "QUESTION"
      },
      "3": {
        "scoreMultiplier": 3,
        "title": "Final Round",
        "type": "COMIC"
      }
    },
    "votes": {}
  }
}
```
## Nice work! You've just retrieved the document!
