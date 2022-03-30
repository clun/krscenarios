#!/bin/bash
export JAVA_HOME="/usr/lib/jvm/default-java"

echo "export JAVA_HOME=\"/usr/lib/jvm/default-java\"" >> /etc/profile

echo 'PATH="$PATH:/root/apache-pulsar-2.7.2/bin"' >> .bashrc
export PATH="$PATH:/root/apache-pulsar-2.7.2/bin"
source .bashrc

sleep 3
tar xvfz my-pulsar-producer.tar.gz
tar xvfz my-pulsar-consumer.tar.gz
tar xvfz my-pulsar-reader.tar.gz
