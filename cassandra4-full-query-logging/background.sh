#!/bin/bash

/usr/share/cassandra/bin/cassandra -R
until /usr/share/cassandra/bin/cqlsh -e "DESCRIBE KEYSPACES"
do
   sleep 0.1
done

echo "done" >> /opt/katacoda-background-finished