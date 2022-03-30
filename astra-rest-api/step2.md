With our variables set, let's use cURL and the REST API to create a table.

<details>
  <summary style="color:teal"><b>What are the key parts of the REST API cURL command?</b></summary>
  <hr>
  Here's a list of key pieces of information we use to build the cURL command for creating the table.
  <ol>
  <li>The cluster ID, the region and the keyspace name (stored in the various environment variables) used to create the URL.</li>
  <li>The token we just generated in the first step, stored in the `ASTRA_DB_APPLICATION_TOKEN` variable.</li>
  <li>The JSON for creating the table.</li>
  </ol>
  <hr>
</details>


<details>
  <summary style="color:teal"><b>What does the Astra DB REST API URL look like?</b></summary>
  <hr>

  We'll build the URL from the various components in the environment variables.
  The complete URL will look similar to this.

  ```
  https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/rest/v2/keyspaces/$ASTRA_DB_KEYSPACE/tables
  ```
  <hr>
</details>


<details>
  <summary style="color:teal"><b>What headers does the cURL command use?</b></summary>
  <hr>

We can use two headers with the cURL command.

```
--header "Content-Type: application/json"
--header "X-Cassandra-Token: $ASTRA_DB_APPLICATION_TOKEN"
```
<hr>
</details>


<details>
  <summary style="color:teal"><b>What JSON should we use to create the table?</b></summary>
  <hr>
The name of this table is _products_ and contains five columns as shown in the following JSON.
<br>

```
{
  "name":"products",
  "ifNotExists":true,
  "columnDefinitions":
    [
      {
        "name":"id",
        "typeDefinition":"uuid",
        "static":false
      },
      {
        "name":"productname",
        "typeDefinition":"text",
        "static":false
      },
      {
        "name":"description",
        "typeDefinition":"text",
        "static":false
      },
      {
        "name":"price",
        "typeDefinition":"decimal",
        "static":false
      },
      {
        "name":"created",
        "typeDefinition":"timestamp",
        "static":false
      }
    ],
  "primaryKey": {
    "partitionKey":["id"]
  }
}
```
<br>

Notice that the primary key is the _id_ column.
Also, notice that we only try to create the table if it does not already exist.
<hr>
</details>


Here's the cURL request that we can now execute.

```
curl --request POST \
  --url https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/rest/v2/schemas/keyspaces/$ASTRA_DB_KEYSPACE/tables \
  --header "content-type: application/json" \
  --header "X-Cassandra-Token: $ASTRA_DB_APPLICATION_TOKEN" \
  --data '{"name":"products","ifNotExists":true,"columnDefinitions": [ {"name":"id","typeDefinition":"uuid"}, {"name":"productname","typeDefinition":"text"}, {"name":"description","typeDefinition":"text"}, {"name":"price","typeDefinition":"decimal"}, {"name":"created","typeDefinition":"timestamp"}],"primaryKey": {"partitionKey":["id"]}}' | jq
```{{execute}}

## Easy! Now we have a table!
