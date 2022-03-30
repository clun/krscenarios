#!/bin/bash

pip install dse-driver==2.11.1

echo "deb http://downloads.apache.org/cassandra/debian 40x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
deb http://downloads.apache.org/cassandra/debian 40x main

curl https://downloads.apache.org/cassandra/KEYS | sudo apt-key add -

sudo apt-get update

sudo apt-get install cassandra