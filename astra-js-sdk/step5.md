<br>
<center>
  <img src="./assets/astra.png" width="200" height="74">
</center>

Let's complete the code for the `insertGame` async function by connecting to the Astra DB database.

<div style="background-color:#cccccc"> **Open** `battlestax/functions/insertGame.js`{{open}}</div>

At the top of the file, notice how we import the JavaScript SDK so we can create the Astra DB Client.
Find more information about the JavaScript SDK library [HERE](https://www.npmjs.com/package/@astrajs/collections).

We create our `astraClient` by passing credentials using the environment variables we set earlier:

Click on the *_copy to editor_* button in the upper right corner of the code below.
<pre class="file" data-filename="battlestax/functions/insertGame.js" data-target="insert" data-marker="    // let's set our Astra DB connection configuration">    // let's set our Astra DB connection configuration
    astraDatabaseId: process.env.ASTRA_DB_ID,
    astraDatabaseRegion: process.env.ASTRA_DB_REGION,
    applicationToken: process.env.ASTRA_DB_APPLICATION_TOKEN,</pre>


We'll create a new game using the `gamesCollection`.

Click on the *_copy to editor_* button in the upper right corner of the code below.
<pre class="file" data-filename="battlestax/functions/insertGame.js" data-target="insert" data-marker="    // let's create a new game with the gamesCollection">    // let's create a new game with the gamesCollection
    const res = await gamesCollection.create(gameId, gamePayload);</pre>

If there are no problems creating the game, return a status code of 200.

Click on the *_copy to editor_* button in the upper right corner of the code below.
<pre class="file" data-filename="battlestax/functions/insertGame.js" data-target="insert" data-marker="    // let's return a 200 with the resoponse from Astra DB">  // let's return a 200 with the response from Astra DB
    return {
      statusCode: 200,
      body: JSON.stringify(res),
    };</pre>

But, if there is a problem creating the game, return a status code of 500.

Click on the *_copy to editor_* button in the upper right corner of the code below.
<pre class="file" data-filename="battlestax/functions/insertGame.js" data-target="insert" data-marker="    // let's return a 500 on error">    // let's return a 500 on error
    return {
      statusCode: 500,
      body: JSON.stringify(e),
    };</pre>


Now, the function has the ability to connect to the Astra DB instance and provision a new game.

Let's run our application again.

```
npm run dev
```{{execute T1}}

Wait for the service to initialize.
Then, check out the `insertGame` endpoint.

```
curl --request GET https://[[HOST_SUBDOMAIN]]-8888-[[KATACODA_HOST]].environments.katacoda.com/.netlify/functions/insertGame | jq
```{{execute T2}}

Look for this message to see that the endpoint is working:

```
{
  "message": "must provide a valid game ID"
}
```

Have a look at our running React application on port 3000:

https://[[HOST_SUBDOMAIN]]-3000-[[KATACODA_HOST]].environments.katacoda.com

**Once you finish this step, hit `Ctrl+C` to stop the application.**

```
^C
```{{execute ctrl-seq T1}}

## In the next step, we will be testing it our endpoint!
