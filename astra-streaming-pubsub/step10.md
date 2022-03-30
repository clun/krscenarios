At this point, the consumers might have already processed and acknowledged all the messages published by the producer.
However, Pulsar retains the messages according to the retention policy, so we can replay the messages using the reader.

Let's start the Reader in Terminal seven:
```
. setup.sh
java -cp my-pulsar-reader/target/my-pulsar-reader-1.0-SNAPSHOT-jar-with-dependencies.jar com.example.pulsar.MyPulsarReader
```{{execute T7}}

Wait for the Reader to read all 120 messages.

Now, replay the messages one more time:
```
java -cp my-pulsar-reader/target/my-pulsar-reader-1.0-SNAPSHOT-jar-with-dependencies.jar com.example.pulsar.MyPulsarReader
```{{execute T7}}

We see that a Consumer only sees a message once, but a Reader can read messages many times.

## Hey! Readers are cool!
