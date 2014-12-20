#!/bin/bash


set -e

if [ -f /etc/configured ]; then
        echo 'already configured'
else
      #code that need to run only one time ....
        echo $(xmlstarlet sel -t -v 'yazgfs/config/pass' /etc/koha/sites/library/koha-conf.xml)
        #needed for fix problem with ubuntu and cron
        update-locale 
        date > /etc/configured
        koha-post-install-setup
fi
