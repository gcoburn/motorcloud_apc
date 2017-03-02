#!/bin/sh
/app/start_app.sh &
while [ ! -d $CATALINA_HOME/log ]
do
sleep 2
done
cd $CATALINA_HOME/log
while [ ! -f *.log ]
do
sleep 2
done
tail -f *
