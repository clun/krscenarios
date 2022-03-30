Let's use another cURL command and the the REST API to add a row of data.

<details>
  <summary style="color:teal"><b>What is the Astra DB URL endpoint for adding a record?</b></summary>
  <hr>
To create the endpoint URL, we start with the same base URL that we used when we created the table, but we append a bit more information.
The remainder of the URL has the form `keyspaces/<keyspace name>/<table name>`.

The complete URL should look something like this.

```
https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/rest/v2/keyspaces/$ASTRA_DB_KEYSPACE/products
```
  <hr>
</details>

We'll use similar cURL options to those we used when we created the table.
<br>

<details>
  <summary style="color:teal"><b>What is the JSON for the command?</b></summary>
  <hr>
  The JSON looks like this.
  Notice that the JSON contains a name corresponding to the column name in the table, and the value for that column.
```
{
  "id": "e9b6c02d-0604-4bab-a3ea-6a7984654631",
  "productname": "Heavy Lift Arms",
  "description": "Heavy lift arms capable of lifting 1,250 lbs of weight per arm. Sold as a set.",
  "price": "4199.99",
  "created": "2019-01-10T09:48:31.020Z"
}
```
  <hr>
</details>

Here's the command. Give it a try!

```
curl --request POST \
    https://$ASTRA_DB_ID-$ASTRA_DB_REGION.apps.astra.datastax.com/api/rest/v2/keyspaces/$ASTRA_DB_KEYSPACE/products \
    --header 'content-type: application/json' \
    --header "x-cassandra-token: $ASTRA_DB_APPLICATION_TOKEN" \
    --data '{"id": "e9b6c02d-0604-4bab-a3ea-6a7984654631", "productname": "Heavy Lift Arms", "description": "Heavy lift arms capable of lifting 1,250 lbs of weight per arm. Sold as a set.", "price": "4199.99", "created": "2019-01-10T09:48:31.020Z"}' | jq
```{{execute}}

## Wow! We have a record in the table!
