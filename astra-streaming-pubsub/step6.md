Finally, let's build a message reader.

<details>
  <summary style="color:teal"><b>What is the difference between a consumer and a reader</b></summary>
  <hr>
  As a consumer processes the messages, it _consumes_ the messages, whereas a reader can reread messages after processing them.
  The difference will become clearer later in this exercise.
  <hr>
</details>


Open file `MyPulsarReader.java`:

<div style="background-color:#cccccc"> **Open** `my-pulsar-reader/src/main/java/com/example/pulsar/MyPulsarReader.java`{{open}}</div>

We see from the _TODOs_ that the code will follow these steps:
- Create a PulsarClient
- Create a new Reader
- Read all 120 messages
- Close the Reader and PulsarClient

Similar to the Producer and Consumer, we instantiate a `PulsarClient` object:
<pre class="file" data-filename="my-pulsar-reader/src/main/java/com/example/pulsar/MyPulsarReader.java" data-target="insert" data-marker="//TODO-create-PulsarClient">
      PulsarClient client = PulsarClient.builder()
                    .serviceUrl(System.getenv("ASTRA_STREAMING_SERVICE_URL"))
                    .authentication(AuthenticationFactory.token(System.getenv("ASTRA_STREAMING_TOKEN")))
                    .build();
</pre>

We create a `Reader` on topic `persistent://$ASTRA_STREAMING_TENANT/default/$ASTRA_STREAMING_TOPIC` starting at the earliest available message:
<pre class="file" data-filename="my-pulsar-reader/src/main/java/com/example/pulsar/MyPulsarReader.java" data-target="insert" data-marker="//TODO-create-Reader">
      final String TOPIC = "persistent://"+
          System.getenv("ASTRA_STREAMING_TENANT")+
          "/default/"+
          System.getenv("ASTRA_STREAMING_TOPIC");

      Reader<byte[]> reader = client.newReader(Schema.AVRO(Measurement.class))
              .topic(TOPIC)
              .startMessageId(MessageId.earliest)
              .create();                           
</pre>

Here's the loop to read 120 messages:
<pre class="file" data-filename="my-pulsar-reader/src/main/java/com/example/pulsar/MyPulsarReader.java" data-target="insert" data-marker="//TODO-read">
      for (int i = 1 ; i <= 120 ; i++) {
        Message&lt;Measurement&gt; msg = reader.readNext();
        if(msg != null) {
          Measurement measurement = msg.getValue();
          System.out.println("RECEIVED: " + measurement.sensor + ", " + measurement.timestamp + ", " + measurement.value);
        }
      }
</pre>

Finally, we need to close the reader and client, and release all the resources:
<pre class="file" data-filename="my-pulsar-reader/src/main/java/com/example/pulsar/MyPulsarReader.java" data-target="insert" data-marker="//TODO-close">
      reader.close();
      client.close();
</pre>

Let's build the reader application:
```
mvn -f my-pulsar-reader/pom.xml clean compile assembly:single        
```{{execute}}

## Woot! Now we have all three Pulsar clients (i.e., producer, consumer, and reader).
