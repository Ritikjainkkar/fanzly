#!bin/bash

sudo apt update
sudo apt install default-jdk -y
java -version
sudo wget -O - https://debian.neo4j.com/neotechnology.gpg.key | sudo apt-key add -
sudo echo 'deb https://debian.neo4j.com stable 4.1' | sudo tee -a /etc/apt/sources.list.d/neo4j.list
sudo apt-get update
sudo apt-get install neo4j=1:4.1.3 -y
neo4j --version
systemctl enable neo4j

sed -i 's/#dbms.default_database/dbms.default_database/; 
s/#dbms.default_listen_address/dbms.default_listen_address/;
s/#dbms.connector.bolt.listen_address/dbms.connector.bolt.listen_address/;
s/#dbms.connector.http.listen_address/dbms.connector.http.listen_address/;' /etc/neo4j/neo4j.conf

sudo service neo4j restart
