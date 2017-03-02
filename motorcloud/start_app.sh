#!/bin/bash

set -e
# Set reasonable java memory options if we have an instance
# with greater than or equal to 128MB of RAM. Anything below this
# can use java defaults.
export CONTAINER_MEMORY=256
if [ "$CONTAINER_MEMORY" -ge "128" ]
then
  # Default to container size minus 40MB (Enough to run the OS)
  export _CATALINA_OPTS="-Xms88m -Xmx$(expr $CONTAINER_MEMORY - 40)m"
fi

echo "Starting server: $CATALINA_HOME/bin/catalina.sh run"
rm -rf $CATALINA_HOME/webapps/*
sudo cp /app/*.war $CATALINA_HOME/webapps/ROOT.war
#
# Added by Peter Fray to move the context.xml in the right place
#
sudo cp /app/context.xml $CATALINA_HOME/conf/.
#
# Replace the two ENV VARS 
# DB_PASSWORD
# DB_HOST
# in $CATALINA_HOME/conf/context.xml
for i in `env | grep "DB_"` ; do
        target=`echo $i | cut -d"=" -f1`
        param=`echo $i | cut -d"=" -f2`
        sudo sed 's!'{{env_map."$target"}}'!'"$param"'!' -i $CATALINA_HOME/conf/context.xml
done




if [ -z "$PORT" ]
then
  echo "PORT env variable not set. Keeping default server.xml."
else
  echo "Setting Tomcat port to $PORT"
  sudo sed -i -e "s#8080#$PORT#g" $CATALINA_HOME/conf/server.xml
fi

if [ -z "$CATALINA_OPTS" ]
then
  echo "CATALINA_OPTS env variable not set. Using default values from _CATALINA_OPTS."
  export CATALINA_OPTS=$_CATALINA_OPTS
fi

$CATALINA_HOME/bin/catalina.sh run &
