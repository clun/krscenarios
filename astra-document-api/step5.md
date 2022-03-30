If you looked at the JSON body of document we stored in our database earlier, you might have noticed that this games document does not have any players yet.
The `players` subdocument is empty.

`"players": {}`

Let's change this by using the `PATCH` request method to partially modify our games document, adding the names of some players and their scores.

 <details>
  <summary style="color:teal"><b>Take a look at the JSON</b></summary>
<hr>
<div style="background: #f8f8f8; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #000000; font-weight: bold">{</span>
   <span style="color: #204a87; font-weight: bold">&quot;players&quot;</span><span style="color: #000000; font-weight: bold">:{</span>
      <span style="color: #204a87; font-weight: bold">&quot;1&quot;</span><span style="color: #000000; font-weight: bold">:{</span>
         <span style="color: #204a87; font-weight: bold">&quot;name&quot;</span><span style="color: #000000; font-weight: bold">:</span><span style="color: #4e9a06">&quot;CRW&quot;</span><span style="color: #000000; font-weight: bold">,</span>
         <span style="color: #204a87; font-weight: bold">&quot;score&quot;</span><span style="color: #000000; font-weight: bold">:</span><span style="color: #0000cf; font-weight: bold">100</span>
      <span style="color: #000000; font-weight: bold">},</span>
      <span style="color: #204a87; font-weight: bold">&quot;2&quot;</span><span style="color: #000000; font-weight: bold">:{</span>
         <span style="color: #204a87; font-weight: bold">&quot;name&quot;</span><span style="color: #000000; font-weight: bold">:</span><span style="color: #4e9a06">&quot;DKG&quot;</span><span style="color: #000000; font-weight: bold">,</span>
         <span style="color: #204a87; font-weight: bold">&quot;score&quot;</span><span style="color: #000000; font-weight: bold">:</span><span style="color: #0000cf; font-weight: bold">200</span>
      <span style="color: #000000; font-weight: bold">}</span>
   <span style="color: #000000; font-weight: bold">}</span>
<span style="color: #000000; font-weight: bold">}</span>
</pre></div>
<hr>
</details>

```
curl --request PATCH \
https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/rest/v2/namespaces/$ASTRA_DB_KEYSPACE/collections/games/1 \
--header "Content-Type: application/json" \
--header "x-cassandra-token: $ASTRA_DB_APPLICATION_TOKEN" \
--data-raw '{
    "players": {
        "1": {
            "name": "CRW",
            "score": 100
        },
        "2": {
            "name": "DKG",
            "score": 200
        }
    }
}' | jq
```{{execute}}

After a successful `PATCH` request, we would expect to see the following:
```
{
  "documentId": "1"
}```

We can check and see if our patch worked by using a `GET` request to see the `players` subdocument.

```
curl --request GET \
https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/rest/v2/namespaces/$ASTRA_DB_KEYSPACE/collections/games/1/players \
--header "x-cassandra-token: $ASTRA_DB_APPLICATION_TOKEN" | jq
```{{execute}}

## You've just made an update to the document!
