#!/bin/bash


wget https://downloads.apache.org/cassandra/4.0.0/apache-cassandra-4.0.0-bin.tar.gz
#scp apache-cassandra-4.0.0-bin.tar.gz root@[[HOST2_IP]]:/root/

ssh root@[[HOST1_IP]] -o StrictHostKeyChecking=no "tar xzf apache-cassandra-4.0.0-bin.tar.gz"
ssh root@[[HOST2_IP]] -o StrictHostKeyChecking=no "tar xzf apache-cassandra-4.0.0-bin.tar.gz"

ssh root@[[HOST1_IP]] "sed -i 's/^listen_address:.*$/listen_address: [[HOST1_IP]]/g' apache-cassandra-4.0.0/conf/cassandra.yaml"
ssh root@[[HOST2_IP]] "sed -i 's/^listen_address:.*$/listen_address: [[HOST2_IP]]/g' apache-cassandra-4.0.0/conf/cassandra.yaml"

ssh root@[[HOST1_IP]] "sed -i 's/^rpc_address:.*$/rpc_address: [[HOST1_IP]]/g' apache-cassandra-4.0.0/conf/cassandra.yaml"
ssh root@[[HOST2_IP]] "sed -i 's/^rpc_address:.*$/rpc_address: [[HOST2_IP]]/g' apache-cassandra-4.0.0/conf/cassandra.yaml"

#seeds:
ssh root@[[HOST1_IP]] "sed -i 's/127.0.0.1:7000/[[HOST1_IP]]:7000/g' apache-cassandra-4.0.0/conf/cassandra.yaml"
ssh root@[[HOST2_IP]] "sed -i 's/127.0.0.1:7000/[[HOST1_IP]]:7000/g' apache-cassandra-4.0.0/conf/cassandra.yaml"

ssh root@[[HOST1_IP]] "mv apache-cassandra-4.0.0 /usr/share/cassandra"
ssh root@[[HOST2_IP]] "mv apache-cassandra-4.0.0 /usr/share/cassandra"
ssh root@[[HOST1_IP]] "rm apache-cassandra-4.0.0-bin.tar.gz"
ssh root@[[HOST2_IP]] "rm apache-cassandra-4.0.0-bin.tar.gz"


ssh root@[[HOST1_IP]] 'export JAVA_HOME="/usr/lib/jvm/default-java"'
ssh root@[[HOST2_IP]] 'export JAVA_HOME="/usr/lib/jvm/default-java"'
export JAVA_HOME="/usr/lib/jvm/default-java"

ssh root@[[HOST1_IP]] 'echo '\''PATH="$PATH:/usr/share/cassandra/bin:/usr/share/cassandra/tools/bin"'\'' >> .bashrc'
ssh root@[[HOST2_IP]] 'echo '\''PATH="$PATH:/usr/share/cassandra/bin:/usr/share/cassandra/tools/bin"'\'' >> .bashrc'
echo 'PATH="$PATH:/usr/share/cassandra/bin:/usr/share/cassandra/tools/bin"' >> .bashrc

echo '[[HOST1_IP]] node1' >> /etc/hosts   
echo '[[HOST2_IP]] node2' >> /etc/hosts  

echo "export HOST1_IP=\"[[HOST1_IP]]\"" >> .bashrc
echo "export HOST2_IP=\"[[HOST2_IP]]\"" >> .bashrc
export HOST1_IP="[[HOST1_IP]]"
export HOST2_IP="[[HOST2_IP]]"

ssh root@[[HOST1_IP]] '/usr/share/cassandra/bin/cassandra -R'
ssh root@[[HOST1_IP]] 'while [ `grep "Starting listening for CQL clients" /usr/share/cassandra/logs/system.log | wc -l` -lt 1 ]; do sleep 10; done'

sleep 20
ssh root@[[HOST2_IP]] '/usr/share/cassandra/bin/cassandra -R'
ssh root@[[HOST2_IP]] 'while [ `grep "Starting listening for CQL clients" /usr/share/cassandra/logs/system.log | wc -l` -lt 1 ]; do sleep 10; done'

ssh root@[[HOST1_IP]] "echo \"done\" >> /opt/katacoda-background-finished"
ssh root@[[HOST2_IP]] "echo \"done\" >> /opt/katacoda-background-finished"
echo "done" >> /opt/katacoda-background-finished
