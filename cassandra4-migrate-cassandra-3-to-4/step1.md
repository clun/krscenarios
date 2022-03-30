In this step, a script running in the background is installing JDK 8 and Cassandra 3.11.9. The script creates a *single-node* Cassandra cluster. The script performs the following actions:

1. Remove JDK 11 (the base image for this exercise has JDK 11 installed by default. Cassandra 3.x *does not* support JDK 11)
2. Install JDK 8
3. Install Cassandra 3.11.9 and configure environment variables
4. Start Cassandra

Wait until you see the message *Cassandra setup complete*. (This may take a few minutes.)

![Setup Complete](./assets/setup-complete.jpg)

Click to verify that the Cassandra version is 3.11.9.
```
nodetool version
```{{execute T1}}

You should see the correct version.
![Version 3.11.9](./assets/version.png)

After verifying the version, clear the screen and continue to the next step.
```
clear
```{{execute T1}}
