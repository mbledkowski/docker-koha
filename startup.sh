#!/bin/bash


set -e

if [ -f /etc/configured ]; then
        a2enmod suexec
        echo 'already configured'
else
      #code that need to run only one time ....
        a2enmod suexec
        xmlstarlet sel -t -v 'yazgfs/config/pass' /etc/koha/sites/library/koha-conf.xml
        #a2enmod suexec
        #needed for fix problem with ubuntu and cron
        update-locale 
        date > /etc/configured
fi
