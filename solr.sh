#!/bin/sh
### In solr.sh (make sure this file is chmod +x):
# `/sbin/setuser mysql` runs the given command as the user `mysql`.
# If you omit that part, the command will be run as root.

sleep 15
cd /opt/solr-4.9.1/koha/
exec  java -jar start.jar >>/var/log/solr.log 2>&1
