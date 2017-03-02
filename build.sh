#!/bin/sh
#
# lets work in a safe namespace
# set the namespace
apc ns /sandbox/gary.coburn
#
# Create network for use my the applications and DB
#
# delete network if it exists already then create new network
apc network delete moto-net --quiet --batch || echo "Network not found, skipping"
apc network create /sandbox/gary.coburn::moto-net --batch

#
# Create mysql application based on docker container
#
# delete mysql app if it exists then pull from docker image
apc app delete mysql --batch || echo "doesnt exist"
apc docker run mysql --restart always --image mysql --tag 5.7.11 --port 3306 --provider /dev::apcfs -m 1gb --env-set MYSQL_ROOT_PASSWORD=P@ssw0rd --batch

# stop the mysql app
# join the newly created network
# open egress
# open ssh and
apc app stop mysql
apc network join network::/sandbox/gary.coburn::moto-net --job mysql --discovery-address mysql --batch
apc app update mysql -ae --batch
apc app update mysql --allow-ssh --batch
apc app start mysql

# Connect to the mysql job
#
# update apt
# install mysql server
# edit the my.cnf and move the data dir to nfs mount
# start mysql
# create the schema
apc app connect mysql << EOF
apt-get update
apt-get install mysql-server -y
cd /etc/mysql
sed -i "/bind-address/c bind-address = 0.0.0.0" my.cnf
service mysql start
mysql -u root -pP@ssw0rd -h localhost << EOF2
CREATE DATABASE IF NOT EXISTS motorcloud;
USE motorcloud;
DROP TABLE IF EXISTS Players;
CREATE TABLE Players (
  player_id int(11) NOT NULL AUTO_INCREMENT,
  first_name varchar(100) DEFAULT NULL,
  last_name varchar(100) DEFAULT NULL,
  email_id varchar(100) DEFAULT NULL,
  twitter_id varchar(100) DEFAULT NULL,
  stage_name varchar(100) DEFAULT NULL,
  catch_phrase varchar(100) DEFAULT NULL,
  mini_bio varchar(500) DEFAULT NULL,
  contact varchar(1) DEFAULT NULL,
  PRIMARY KEY (player_id)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;
LOCK TABLES Players WRITE;
INSERT INTO Players VALUES (63,'Gary','Coburn','gcoburn@vmware.com','@garycoburn','Reggie Seno','Me Bang Drum','I put the boom boom in the room room.','Y'),(64,'Jay','Marshall','jj@jjhollywood.com','@jjhollywood','JJ Hollywood','Sweatin\' the Rock... Bleedin\' the Roll','I put the \"aas\" in PaaS.','N');
UNLOCK TABLES;
GRANT ALL ON *.* to root@'%' IDENTIFIED BY 'P@ssw0rd';
FLUSH PRIVILEGES;
EOF2
mysqladmin -u root password P@ssw0rd
EOF

#
# Now lets work on the war file
#
# change to motorcloud war file directory
cd motorcloud

# create the application
apc app delete motoapp --batch || echo "app doesnt exist...skipping"
apc app create motoapp -ae --allow-ssh  --start-cmd '/app/bash_start.sh'  --env-set 'DB_HOST=mysql.apcera.local' --env-set 'DB_PASSWORD=P@ssw0rd' --batch

# join the same network as the mysql app
# start the application
apc network join network::/sandbox/gary.coburn::moto-net --job motoapp --discovery-address motoapp --batch
apc app start motoapp
