Let's build the message consumer.

Open file `MyPulsarConsumer.java`:

<div style="background-color:#cccccc"> **Open** `my-pulsar-consumer/src/main/java/com/example/pulsar/MyPulsarConsumer.java`{{open}}</div>

We see from the _TODOs_ that the code will follow these steps:
- Create a PulsarClient
- Create a Consumer
- Receive 60 messages (we will run two instances of this consumer for a total of 120 messages)
- Close the Consumer and PulsarClient

We'll instantiate a `PulsarClient` object the same way we did for the producer:
<pre class="file" data-filename="my-pulsar-consumer/src/main/java/com/example/pulsar/MyPulsarConsumer.java" data-target="insert" data-marker="//TODO-create-PulsarClient">
      PulsarClient client = PulsarClient.builder()
                    .serviceUrl(System.getenv("ASTRA_STREAMING_SERVICE_URL"))
                    .authentication(AuthenticationFactory.token(System.getenv("ASTRA_STREAMING_TOKEN")))
                    .build();
</pre>

We can use the client to create a `Consumer` and subscribe to topic `persistent://$ASTRA_STREAMING_TENANT/default/$ASTRA_STREAMING_TOPIC`:
<pre class="file" data-filename="my-pulsar-consumer/src/main/java/com/example/pulsar/MyPulsarConsumer.java" data-target="insert" data-marker="//TODO-create-Consumer">
      final String TOPIC = "persistent://"+
          System.getenv("ASTRA_STREAMING_TENANT")+
          "/default/"+
          System.getenv("ASTRA_STREAMING_TOPIC");

      Consumer consumer = client.newConsumer(Schema.AVRO(Measurement.class))
              .topic(TOPIC)
              .subscriptionName("my-subscription")
              .subscriptionType(SubscriptionType.Shared)
              .subscribe();
</pre>

Here's the code to receive 60 messages:
<details>
  <summary style="color:teal"><b>Wait! I thought we produced 40 messages. Why consume 60?</b></summary>
  <hr>
  We are simulating home appliances sending messages.
  We will have three appliances each producing 40 messages for a total of 120 messages sent.

  We will create two consumers that each consume 60 messages for a total of 120 messages consumed.
  So, it all balances out!
  <hr>
</details>
<pre class="file" data-filename="my-pulsar-consumer/src/main/java/com/example/pulsar/MyPulsarConsumer.java" data-target="insert" data-marker="//TODO-receive">
      for (int i = 1 ; i <= 60 ; i++) {
        Message&lt;Measurement&gt; m = consumer.receive();

        try {
          Measurement measurement = m.getValue();
          System.out.println("RECEIVED: " + measurement.sensor + ", " + measurement.timestamp + ", " + measurement.value);
          // Acknowledge the message
          consumer.acknowledge(m);
        } catch (Exception e) {
          // Message failed to process, redeliver later
          consumer.negativeAcknowledge(m);
        }
      }
</pre>

Finally, we need to close the consumer and client to release all the resources:
<pre class="file" data-filename="my-pulsar-consumer/src/main/java/com/example/pulsar/MyPulsarConsumer.java" data-target="insert" data-marker="//TODO-close">
      consumer.close();
      client.close();
</pre>

Let's build the consumer application:
```
mvn -f my-pulsar-consumer/pom.xml clean compile assembly:single        
```{{execute}}

## Ha! Now we have a message consumer!
