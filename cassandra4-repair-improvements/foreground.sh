#!/bin/bash
export JAVA_HOME="/usr/lib/jvm/default-java"
export PATH="$PATH:/usr/share/cassandra/bin:/usr/share/cassandra/tools/bin"
clear
sleep 5; wait.sh
echo "Cassandra Cluster with nodes [[HOST1_IP]] and [[HOST2_IP]] has started!"
