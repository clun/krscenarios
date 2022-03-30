In this step, you will dowanload and unpack the Cassandra 4.0.0 distribution.

Download the tarball.
```
wget https://archive.apache.org/dist/cassandra/4.0.0/apache-cassandra-4.0.0-bin.tar.gz
```{{execute T1}}

Extract Cassandra.
```
tar xzf apache-cassandra-4.0.0-bin.tar.gz
```{{execute T1}}

Move the Cassandra folder.
```
mv apache-cassandra-4.0.0 /usr/share/cassandra4
```{{execute T1}}

Delete the archive.
```
rm apache-cassandra-4.0.0-bin.tar.gz
```{{execute T1}}

Update the PATH variable.
```
export PATH="/usr/bin:/usr/share/cassandra4/bin:/usr/share/cassandra4/tools/bin:$PATH"
```{{execute T1}}

Clear the screen and continue.
```
clear
```{{execute T1}}