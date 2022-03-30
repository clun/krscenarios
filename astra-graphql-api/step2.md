With our variables set, let's use cURL and the GraphQL API to create a couple tables named _books_ and _authors_.

<details>
  <summary style="color:teal"><b>What are the key parts of the GraphQL API cURL command?</b></summary>
  <hr>
  Here's a list of key pieces of information we use to build this table.
  <ol>
  <li>The cluster ID, the region and the keyspace name (stored in the various environment variables) used to create the URL.</li>
  <li>The token we just generated in the first step, stored in the `ASTRA_DB_APPLICATION_TOKEN` variable.</li>
  <li>The JSON for creating the tables.</li>
  </ol>
<hr>
</details>

<details>
  <summary style="color:teal"><b>What does the Astra DB GraphQL API URL look like?</b></summary>
  <hr>
  We'll build the URL from the various environment variables.
  The complete URL will look similar to this.

```
https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/graphql-schema
```

<hr>
</details>

<details>
  <summary style="color:teal"><b>What headers does the cURL command use?</b></summary>
  <hr>
We can use these headers with the cURL command.

```
--header 'Content-Type: application/json'
--header 'x-cassandra-token: $ASTRA_DB_APPLICATION_TOKEN'
```
<hr>
</details>

<details>
  <summary style="color:teal"><b>What JSON should we use to create the tables?</b></summary>
  <hr>
The names of these tables are _books_ and _authors_.
Each of these tables contains a couple of columns as shown in the following JSON.

```
{
  "query":"mutation
    {
      books:
        createTable(
          keyspaceName: \"<place_keyspace_here>\"
          tableName: \"books\"
          partitionKeys: [
              {
                name: \"title\",
                type: {basic: TEXT}
              }
            ]
            values: [
              {
                name: \"author\",
                type: { basic: TEXT }
              }
            ]
          )
      authors:
        createTable(
          keyspaceName: \"<place_keyspace_here>\"
          tableName: \"authors\"
          partitionKeys: [
            {
              name: \"name\",
              type: {basic: TEXT}
            }
          ]
          clusteringKeys: [
            {
              name: \"title\",
              type: {basic: TEXT}
              order: \"ASC\"
            }
          ]
        )
    }"
}
```
<hr>
</details>

Here's the cURL request that we can now execute.

```
curl "https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/graphql-schema" \
    --header "Content-Type: application/json" \
    --header "x-cassandra-token: $ASTRA_DB_APPLICATION_TOKEN" \
    --data-binary '{"query":"mutation {books: createTable(keyspaceName: \"'"$ASTRA_DB_KEYSPACE"'\" tableName: \"books\"    partitionKeys: [{name: \"title\", type: {basic: TEXT}}] values: [{name: \"author\", type: {basic: TEXT}}]) authors: createTable(keyspaceName: \"'"$ASTRA_DB_KEYSPACE"'\" tableName: \"authors\" partitionKeys: [{ name: \"name\", type: {basic: TEXT}}] clusteringKeys: [{name: \"title\", type: {basic: TEXT}, order: \"ASC\"}])}"}' --compressed | jq
```{{execute}}

---

<p><span style="color:teal">***Note:***</span> *_jq_ is a pretty printer for JSON. We will pipe the results of the cURL commands into _jq_ to make them a little easier to read.*</p>

---

We can inspect our keyspace using GraphQL.

<details>
  <summary style="color:teal"><b>What JSON should we use to inspect the keyspace?</b></summary>
  <hr>
```
query GetKeyspace {
  keyspace(name: "<place_keyspace_here>") {
    name
    dcs {
      name
      replicas
    }
    tables {
      name
      columns {
        name
        kind
        type {
          basic
          info {
            name
          }
        }
      }
    }
  }
}
```
<hr>
</details>

Execute this query to inspect the keyspace.

```
curl "https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/graphql-schema" \
    --header "Content-Type: application/json" \
    --header "Accept: application/json" \
    --header "x-cassandra-token: $ASTRA_DB_APPLICATION_TOKEN" \
    --data-binary '{"query":"query GetKeyspace {keyspace(name: \"'"${ASTRA_DB_KEYSPACE}"'\") {name dcs {name replicas} tables { name columns {name kind type {basic info {name}}}}}}"}' --compressed | jq
```{{execute}}

We can also inspect the _authors_ table using this query.

<details>
  <summary style="color:teal"><b>What JSON should we use to inspect a table?</b></summary>
  <hr>
```
query GetTables {
  keyspace(name: "<place_keyspace_here>") {
    name
    table(name: "<place_table_here>") {
      name
      columns {
        name
        kind
        type {
          basic
          info {
            name
          }
        }
      }
    }
  }
}
```
<hr>
</details>

Try it out.

```
curl "https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/graphql-schema" \
    --header "Content-Type: application/json" \
    --header "x-cassandra-token: $ASTRA_DB_APPLICATION_TOKEN" \
    --data-binary '{"query":"query GetTables {\n  keyspace(name: \"'"${ASTRA_DB_KEYSPACE}"'\") {name table(name: \"'"authors"'\") {name columns {name kind type {basic info {name}}}}}}"}' --compressed | jq
```{{execute}}


## Wonderful! Now we have tables!
