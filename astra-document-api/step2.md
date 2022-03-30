Now that we have set up the environment variables, we are ready to use the database.
We are going to build a cURL REST command that will create a games document within our namespace.
Here's a list of key pieces of information we use to build this collection:


1. The cluster ID, the region and the keyspace name (stored in the various environment variables) used to create the URL. Bear in mind that the namespace of your database is same as the keyspace name.
2. The token we just generated in the first step, stored in the `ASTRA_DB_APPLICATION_TOKEN` variable.
3. The JSON for creating the table.

We'll build the URL starting with the `$ASTRA_DB_ID-$ASTRA_DB_REGION`.
Then, we concatenate the default path of `api/rest`.
Next, we add the version `v2`.
Then, we designate the namespace we're using with `/namespaces/$ASTRA_DB_KEYSPACE/` and finish that with `collections`.
Finally, we add the `games` collection to the path as well as the games identifier `1`.

The complete URL will look similar to this:

```
https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/rest/v2/namespaces/$ASTRA_DB_KEYSPACE/collections/games/1`
```

For the next piece of the cURL command, we'll use these headers, including the access token.

```
--header "Content-Type: application/json" \
--header "X-Cassandra-Token: $ASTRA_DB_APPLICATION_TOKEN"
```

We describe the document using JSON in the body of the request.
Notice that the games document has subdocuments representing elements of a game, such as a `gameCode`, `players`, `audienceSize`, `rounds`, `questions` and so on.

 <details>
  <summary style="color:teal"><b>Take a look at the JSON document</b></summary>
<hr>
<div style="background: #f8f8f8; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #000000; font-weight: bold">{</span>
    <span style="color: #204a87; font-weight: bold">&quot;gameCode&quot;</span><span style="color: #000000; font-weight: bold">:</span> <span style="color: #4e9a06">&quot;DANG&quot;</span><span style="color: #000000; font-weight: bold">,</span>
    <span style="color: #204a87; font-weight: bold">&quot;currentState&quot;</span><span style="color: #000000; font-weight: bold">:</span> <span style="color: #000000; font-weight: bold">{</span>
        <span style="color: #204a87; font-weight: bold">&quot;name&quot;</span><span style="color: #000000; font-weight: bold">:</span> <span style="color: #4e9a06">&quot;ADD_PLAYERS&quot;</span><span style="color: #000000; font-weight: bold">,</span>
        <span style="color: #204a87; font-weight: bold">&quot;roundId&quot;</span><span style="color: #000000; font-weight: bold">:</span> <span style="color: #204a87; font-weight: bold">null</span>
    <span style="color: #000000; font-weight: bold">},</span>
    <span style="color: #204a87; font-weight: bold">&quot;players&quot;</span><span style="color: #000000; font-weight: bold">:</span> <span style="color: #000000; font-weight: bold">{},</span>
    <span style="color: #204a87; font-weight: bold">&quot;audienceSize&quot;</span><span style="color: #000000; font-weight: bold">:</span> <span style="color: #0000cf; font-weight: bold">0</span><span style="color: #000000; font-weight: bold">,</span>
    <span style="color: #204a87; font-weight: bold">&quot;rounds&quot;</span><span style="color: #000000; font-weight: bold">:</span> <span style="color: #000000; font-weight: bold">{</span>
        <span style="color: #204a87; font-weight: bold">&quot;1&quot;</span><span style="color: #000000; font-weight: bold">:</span> <span style="color: #000000; font-weight: bold">{</span>
            <span style="color: #204a87; font-weight: bold">&quot;type&quot;</span><span style="color: #000000; font-weight: bold">:</span> <span style="color: #4e9a06">&quot;QUESTION&quot;</span><span style="color: #000000; font-weight: bold">,</span>
            <span style="color: #204a87; font-weight: bold">&quot;title&quot;</span><span style="color: #000000; font-weight: bold">:</span> <span style="color: #4e9a06">&quot;Round 1&quot;</span><span style="color: #000000; font-weight: bold">,</span>
            <span style="color: #204a87; font-weight: bold">&quot;scoreMultiplier&quot;</span><span style="color: #000000; font-weight: bold">:</span> <span style="color: #0000cf; font-weight: bold">1</span>
        <span style="color: #000000; font-weight: bold">},</span>
        <span style="color: #204a87; font-weight: bold">&quot;2&quot;</span><span style="color: #000000; font-weight: bold">:</span> <span style="color: #000000; font-weight: bold">{</span>
            <span style="color: #204a87; font-weight: bold">&quot;type&quot;</span><span style="color: #000000; font-weight: bold">:</span> <span style="color: #4e9a06">&quot;QUESTION&quot;</span><span style="color: #000000; font-weight: bold">,</span>
            <span style="color: #204a87; font-weight: bold">&quot;title&quot;</span><span style="color: #000000; font-weight: bold">:</span> <span style="color: #4e9a06">&quot;Round 1&quot;</span><span style="color: #000000; font-weight: bold">,</span>
            <span style="color: #204a87; font-weight: bold">&quot;scoreMultiplier&quot;</span><span style="color: #000000; font-weight: bold">:</span> <span style="color: #0000cf; font-weight: bold">2</span>
        <span style="color: #000000; font-weight: bold">},</span>
        <span style="color: #204a87; font-weight: bold">&quot;3&quot;</span><span style="color: #000000; font-weight: bold">:</span> <span style="color: #000000; font-weight: bold">{</span>
            <span style="color: #204a87; font-weight: bold">&quot;type&quot;</span><span style="color: #000000; font-weight: bold">:</span> <span style="color: #4e9a06">&quot;COMIC&quot;</span><span style="color: #000000; font-weight: bold">,</span>
            <span style="color: #204a87; font-weight: bold">&quot;title&quot;</span><span style="color: #000000; font-weight: bold">:</span> <span style="color: #4e9a06">&quot;Final Round&quot;</span><span style="color: #000000; font-weight: bold">,</span>
            <span style="color: #204a87; font-weight: bold">&quot;scoreMultiplier&quot;</span><span style="color: #000000; font-weight: bold">:</span> <span style="color: #0000cf; font-weight: bold">3</span>
        <span style="color: #000000; font-weight: bold">}</span>
    <span style="color: #000000; font-weight: bold">},</span>
    <span style="color: #204a87; font-weight: bold">&quot;questions&quot;</span><span style="color: #000000; font-weight: bold">:</span> <span style="color: #000000; font-weight: bold">{</span>
        <span style="color: #204a87; font-weight: bold">&quot;1&quot;</span><span style="color: #000000; font-weight: bold">:</span> <span style="color: #000000; font-weight: bold">{</span>
            <span style="color: #204a87; font-weight: bold">&quot;roundId&quot;</span><span style="color: #000000; font-weight: bold">:</span> <span style="color: #0000cf; font-weight: bold">1</span><span style="color: #000000; font-weight: bold">,</span>
            <span style="color: #204a87; font-weight: bold">&quot;content&quot;</span><span style="color: #000000; font-weight: bold">:</span> <span style="color: #4e9a06">&quot;What time is it?&quot;</span>
        <span style="color: #000000; font-weight: bold">},</span>
        <span style="color: #204a87; font-weight: bold">&quot;2&quot;</span><span style="color: #000000; font-weight: bold">:</span> <span style="color: #000000; font-weight: bold">{</span>
            <span style="color: #204a87; font-weight: bold">&quot;roundId&quot;</span><span style="color: #000000; font-weight: bold">:</span> <span style="color: #0000cf; font-weight: bold">2</span><span style="color: #000000; font-weight: bold">,</span>
            <span style="color: #204a87; font-weight: bold">&quot;content&quot;</span><span style="color: #000000; font-weight: bold">:</span> <span style="color: #4e9a06">&quot;What day is it?&quot;</span>
        <span style="color: #000000; font-weight: bold">},</span>
        <span style="color: #204a87; font-weight: bold">&quot;3&quot;</span><span style="color: #000000; font-weight: bold">:</span> <span style="color: #000000; font-weight: bold">{</span>
            <span style="color: #204a87; font-weight: bold">&quot;roundId&quot;</span><span style="color: #000000; font-weight: bold">:</span> <span style="color: #0000cf; font-weight: bold">3</span><span style="color: #000000; font-weight: bold">,</span>
            <span style="color: #204a87; font-weight: bold">&quot;content&quot;</span><span style="color: #000000; font-weight: bold">:</span> <span style="color: #4e9a06">&quot;https://xkcd.com/386/&amp;quot;</span>
<span style="color: #4e9a06">        }</span>
<span style="color: #4e9a06">    },</span>
<span style="color: #4e9a06">    &quot;</span><span style="color: #a40000; border: 1px solid #ef2929">answers</span><span style="color: #4e9a06">&quot;: {},</span>
<span style="color: #4e9a06">    &quot;</span><span style="color: #a40000; border: 1px solid #ef2929">votes</span><span style="color: #4e9a06">&quot;: {},</span>
<span style="color: #4e9a06">    &quot;</span><span style="color: #a40000; border: 1px solid #ef2929">audienceVotes&quot;</span><span style="color: #000000; font-weight: bold">:</span> <span style="color: #000000; font-weight: bold">{}</span>
<span style="color: #000000; font-weight: bold">}</span>
</pre></div>
<hr>
</details>

Let's go ahead and create a `games` collection in our database with a single games document `1`.



```
curl --request PUT \
    https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/rest/v2/namespaces/$ASTRA_DB_KEYSPACE/collections/games/1 \
    --header "Content-Type: application/json" \
    --header "x-cassandra-token: $ASTRA_DB_APPLICATION_TOKEN" \
    --data-raw '{
        "gameCode": "DANG",
        "currentState": {
            "name": "ADD_PLAYERS",
            "roundId": null
        },
        "players": {},
        "audienceSize": 0,
        "rounds": {
            "1": {
                "type": "QUESTION",
                "title": "Round 1",
                "scoreMultiplier": 1
            },
            "2": {
                "type": "QUESTION",
                "title": "Round 1",
                "scoreMultiplier": 2
            },
            "3": {
                "type": "COMIC",
                "title": "Final Round",
                "scoreMultiplier": 3
            }
        },
        "questions": {
            "1": {
                "roundId": 1,
                "content": "What time is it?"
            },
            "2": {
                "roundId": 2,
                "content": "What day is it?"
            },
            "3": {
                "roundId": 3,
                "content": "https://xkcd.com/386/"
            }
        },
        "answers": {},
        "votes": {},
        "audienceVotes": {}
    }' | jq
```{{execute}}

You should see the following output.

```
{
    "documentId": "1"
}
```

## Awesome, you've created a games collection!
