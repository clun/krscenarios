<center>
  <img src="./assets/stargate.png" width="200" height="124">
</center>

In the previous step, we pushed a simple `helloWorld` "test" function to get a feel for how testing works.
Now, we are going to start working with the "real" code to get our game endpoint working.


Let's start building our basic insertGame serverless function, in the `function/insertGame.js` file:

<div style="background-color:#cccccc"> **Open** `battlestax/functions/insertGame.js`{{open}}</div>

We'll walk through the code as we implement it.


As you can see near the top of the file, we declare the `gameId` and `gamePayload` variables.
Each game has its own unique game ID, and during game play we get a payload from the user.
The Netlify function in this file gets the resulting body of the REST API access.


Using the Netlify function, we get the `gameId` parameter from the path of the incoming REST call, and parse the event body as the `gamePayload`.
By default, Netlify puts your function at the path `/.netlify/functions/insertGame.`

Click on the *_copy to editor_* button in the upper right corner of the code below.
<pre class="file" data-filename="battlestax/functions/insertGame.js" data-target="insert" data-marker="    // let's set the game id">    // let's set the game id
    gameId = event.path.split("insertGame/")[1];</pre>


Similarly, we can get the `gamePayload`.

Click on the *_copy to editor_* button in the upper right corner of the code below.
<pre class="file" data-filename="battlestax/functions/insertGame.js" data-target="insert" data-marker="    // let's parse the incoming payload">    // let's parse the incoming payload
    gamePayload = JSON.parse(event.body);</pre>


Let's not forget about error handling.
If we cannot parse the `gameId` or body from the incoming REST call, the function will return an HTTP status code of 400.


Click on the *_copy to editor_* button in the upper right corner of the code below.
<pre class="file" data-filename="battlestax/functions/insertGame.js" data-target="insert" data-marker="    // let's return a 400 if we can't parse the game id or body">      // let's return a 400 if we can't parse the game id or body
    return {
      statusCode: 400,
      body: JSON.stringify({ message: "must provide a valid game ID" }),
    };</pre>

## Next up, let's connect to Astra DB!
