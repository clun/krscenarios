First, have a look at the current `votes` subdocument. It should be empty.

```
curl --request GET \
https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/rest/v2/namespaces/$ASTRA_DB_KEYSPACE/collections/games/1/votes \
--header "x-cassandra-token: $ASTRA_DB_APPLICATION_TOKEN" | jq
```{{execute}}

In this step, we will use the `PUT` request method to add votes to the previously empty `votes` subdocument.
Notice, we include `/games/1/votes` at the end of the URI to specify which subdocument we want to modify.

<details>
  <summary style="color:teal"><b>Using _PUT_ vs _PATCH_</b></summary>
<hr>
In some databases, we might use _PUT_ to create a document, and _PATCH_ to update a document.
But this is _NOT_ necessarily the case for Stargate and Cassandra.
Cassandra does not perform a read operation before performing a write, as that would poorly impact performance at scale.
Instead, Cassandra performs _upserts_, which is to say that an insert can update and an update can insert.
<br>
Therefore, _PUT_ and _PATCH_ do the same thing.
Stargate supports both verbs for convention's sake, but there is no difference in their semantics.
<hr>
</details>

<details>
  <summary style="color:teal"><b>Take a look at the JSON</b></summary>
<hr>
<div style="background: #f8f8f8; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #000000; font-weight: bold">{</span>
   <span style="color: #204a87; font-weight: bold">&quot;1&quot;</span><span style="color: #000000; font-weight: bold">:{</span>
      <span style="color: #204a87; font-weight: bold">&quot;playerId&quot;</span><span style="color: #000000; font-weight: bold">:</span><span style="color: #4e9a06">&quot;CRW&quot;</span>
   <span style="color: #000000; font-weight: bold">},</span>
   <span style="color: #204a87; font-weight: bold">&quot;2&quot;</span><span style="color: #000000; font-weight: bold">:{</span>
      <span style="color: #204a87; font-weight: bold">&quot;playerId&quot;</span><span style="color: #000000; font-weight: bold">:</span><span style="color: #4e9a06">&quot;DKG&quot;</span>
   <span style="color: #000000; font-weight: bold">}</span>
<span style="color: #000000; font-weight: bold">}</span>
</pre></div>
<hr>
</details>

```
curl --request PUT \
    https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/rest/v2/namespaces/$ASTRA_DB_KEYSPACE/collections/games/1/votes \
    --header "Content-Type: application/json" \
    --header "x-cassandra-token: $ASTRA_DB_APPLICATION_TOKEN" \
    --data-raw '{
        "1": {
            "playerId": "CRW"
        },
        "2": {
            "playerId": "DKG"
        }
    }' | jq
```{{execute}}

Expected output:
```
{
  "documentId": "1"
}```

Retrieve the `votes` subdocument again.
It should now have two players.

```
curl --request GET \
https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/rest/v2/namespaces/$ASTRA_DB_KEYSPACE/collections/games/1/votes \
--header "x-cassandra-token: $ASTRA_DB_APPLICATION_TOKEN" | jq
```{{execute}}

## Well done! We have just modified a subdocument!
