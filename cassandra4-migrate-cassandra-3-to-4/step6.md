In this step, you will configure `cassandra.yaml` and start Cassandra.

Use `sed` to modify the number of virtual nodes in the server. The 3.x cluster had 256 and the 4.0 cluster is set to 16 by default. Set `num_tokens` to 256 in Cassandra 4.x
```
sed -i 's/num_tokens: 16/num_tokens: 256/' /usr/share/cassandra4/conf/cassandra.yaml
```{{execute T1}}

Use `sed` to point the new cluster to the old datafiles.
```
sed -i 's/# data_file_directories:/data_file_directories:/' /usr/share/cassandra4/conf/cassandra.yaml
sed -i 's/#     - \/var\/lib\/cassandra\/data/    - \/usr\/share\/cassandra\/data\/data/' /usr/share/cassandra4/conf/cassandra.yaml
```{{execute T1}}

Start the Cassandra 4.x server.
```
cassandra -R
```{{execute T1}}

Look for the message, *state jump to NORMAL* to indicate that the server is running.
![Version 3.11.9](./assets/normal.jpg)

Clear the screen and continue.
```
clear
```{{execute T1}}