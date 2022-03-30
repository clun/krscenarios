Let's run the producer and consumer.

Recall that the Producer sends 40 messages.
The Consumer receives 60 messages.
So, we'll run two instances of the Consumer and three instances of the Producer.
We'll start the Consumers first.

<details>
  <summary style="color:teal"><b>What does _. setup.sh_ do?</b></summary>
  <hr>
  Recall that we created _setup.sh_ in a previous step.
  This is a script file that sets up the environment variables.
  We need to run it in each terminal before we run the Pulsar client, so that the necessary variable are in place.
  <hr>
</details>


Let's start a Consumer instance in terminal two:
```
. setup.sh
java -cp my-pulsar-consumer/target/my-pulsar-consumer-1.0-SNAPSHOT-jar-with-dependencies.jar com.example.pulsar.MyPulsarConsumer
```{{execute T2}}

Now, let's start the second Consumer instance in terminal three:
```
. setup.sh
java -cp my-pulsar-consumer/target/my-pulsar-consumer-1.0-SNAPSHOT-jar-with-dependencies.jar com.example.pulsar.MyPulsarConsumer
```{{execute T3}}

We'll simulate three devices sending message.
Let's send toaster messages by running the Producer in terminal four with a _toaster_ command line argument:
```
. setup.sh
java -cp my-pulsar-producer/target/my-pulsar-producer-1.0-SNAPSHOT-jar-with-dependencies.jar com.example.pulsar.MyPulsarProducer toaster
```{{execute T4}}

We can send refrigerator messages by running the Producer in terminal five:
```
. setup.sh
java -cp my-pulsar-producer/target/my-pulsar-producer-1.0-SNAPSHOT-jar-with-dependencies.jar com.example.pulsar.MyPulsarProducer refrigerator
```{{execute T5}}

We'll send A/C messages by running the Producer in terminal six:
```
. setup.sh
java -cp my-pulsar-producer/target/my-pulsar-producer-1.0-SNAPSHOT-jar-with-dependencies.jar com.example.pulsar.MyPulsarProducer A/C
```{{execute T6}}

You can switch between the various terminals by clicking on the terminals' tabs.
Check out the output from the Producer and Consumers.

## Amazing! It was that easy to set up and use Astra Streaming!
