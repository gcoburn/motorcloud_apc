#!/bin/sh
#
# lets take the arguments for application name, network name, and db name
echo 'App Name = ' $0
echo 'Network Name = ' $1
echo 'DB Name = ' $2


# lets work in a safe namespace
# set the namespace
apc ns /sandbox/gary.coburn
#
# Create network for use my the applications and DB
#
# delete network if it exists already then create new network
apc network delete $1 --quiet --batch || echo "Network not found, skipping"
apc network create /sandbox/gary.coburn::$1 --batch

#
# Create mysql application based on docker container
#
# delete mysql app if it exists then pull from docker image
apc app delete $2 --batch || echo "doesnt exist"
apc docker run mysql --restart always --image $2 --tag 5.7.11 --port 3306 --provider /dev::apcfs -m 1gb --env-set MYSQL_ROOT_PASSWORD=P@ssw0rd --batch

# stop the mysql app
# join the newly created network
# open egress
# open ssh and
apc app stop $2
apc network join network::/sandbox/gary.coburn::$1 --job $2 --discovery-address $2 --batch
apc app update $2 -ae --batch
apc app update $2 --allow-ssh --batch
apc app start $2

# Connect to the mysql job
#
# update apt
# install mysql server
# edit the my.cnf and move the data dir to nfs mount
# start mysql
# create the schema
apc app connect $2 << EOF
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
# USED ONLY FOR BUILDING WITH JENKINS CHANGE TO LOCAL DIRECTORIES IF RUNNING LOCAL
cp -f /var/lib/jenkins/jobs/motorcloud_apc/workspace/Motorcloud.war /var/lib/jenkins/jobs/motorcloud_app/workspace/motorcloud/Motorcloud.war
cd /var/lib/jenkins/jobs/motorcloud_app/workspace/motorcloud

# create the application
apc app delete $0 --batch || echo "app doesnt exist...skipping"
apc app create $0 -ae --allow-ssh  --start-cmd '/app/bash_start.sh'  --env-set 'DB_HOST=$2.apcera.local' --env-set 'DB_PASSWORD=P@ssw0rd' --batch

# join the same network as the mysql app
# start the application
apc network join network::/sandbox/gary.coburn::$1 --job $0 --discovery-address $0 --batch
apc app start $0
