Let's build the Java message producer.

The messages will be measurements from home appliances.
You can inspect the format of the messages in this file.

<div style="background-color:#cccccc"> **Open** `my-pulsar-producer/src/main/java/com/example/pulsar/Measurement.java`{{open}}</div>

First, open file `MyPulsarProducer.java`:

<div style="background-color:#cccccc"> **Open** `my-pulsar-producer/src/main/java/com/example/pulsar/MyPulsarProducer.java`{{open}}</div>

We see from the _TODOs_ that the code will follow these steps:
- Create a PulsarClient
- Create a Producer
- Send messages
- Close the Producer and PulsarClient


In the code, let's instantiate a `PulsarClient` object using the following code:
<pre class="file" data-filename="my-pulsar-producer/src/main/java/com/example/pulsar/MyPulsarProducer.java" data-target="insert" data-marker="//TODO-create-PulsarClient">
      PulsarClient client = PulsarClient.builder()
                    .serviceUrl(System.getenv("ASTRA_STREAMING_SERVICE_URL"))
                    .authentication(AuthenticationFactory.token(System.getenv("ASTRA_STREAMING_TOKEN")))
                    .build();
</pre>

Next, let's use the Pulsar client to create a `Producer` for the topic `persistent://$ASTRA_STREAMING_TENANT/default/$ASTRA_STREAMING_TOPIC`:
<pre class="file" data-filename="my-pulsar-producer/src/main/java/com/example/pulsar/MyPulsarProducer.java" data-target="insert" data-marker="//TODO-create-Producer">
      final String TOPIC = "persistent://"+
          System.getenv("ASTRA_STREAMING_TENANT")+
          "/default/"+
          System.getenv("ASTRA_STREAMING_TOPIC");

      Producer<String> producer = client.newProducer(Schema.AVRO(Measurement.class))
              .topic(TOPIC)
              .create();
</pre>

We want to send 40 messages to the topic at the rate of about one message per second.
Here's the code to do that:
<pre class="file" data-filename="my-pulsar-producer/src/main/java/com/example/pulsar/MyPulsarProducer.java" data-target="insert" data-marker="//TODO-send">
      Random rand = new Random();
      for (int i = 1 ; i <= 40 ; i++) {
        String msg = args[0] + " " + i;
        System.out.println("SENDING: "+msg);

        Measurement m = new Measurement();
        m.sensor = "sensor-"+args[0];
        m.timestamp = System.currentTimeMillis();
        m.value = rand.nextInt(50) + 61;
        producer.newMessage().value(m).send();

        java.util.concurrent.TimeUnit.MILLISECONDS.sleep(rand.nextInt(2000));
      }
</pre>

Finally, we need to close the producer and client to release all the resources:
<pre class="file" data-filename="my-pulsar-producer/src/main/java/com/example/pulsar/MyPulsarProducer.java" data-target="insert" data-marker="//TODO-close">
      producer.close();
      client.close();
</pre>

Let's build the producer application:
```
mvn -f my-pulsar-producer/pom.xml clean compile assembly:single        
```{{execute}}

## Wow! That's all there is to making a message publisher!
