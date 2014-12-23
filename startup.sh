#!/bin/bash


set -e

if [ -f /etc/configured ]; then
        echo 'already configured'
else
        #code that need to run only one time ....
        /usr/bin/mysqld_safe &
        sleep 5s
                a2enmod rewrite
                a2enmod suexec
                a2enmod cgi
                koha-create --create-db library
                #security tweak
                mysqladmin -u root password mysqlpsswd
                mysqladmin -u root -pmysqlpsswd reload
                a2dissite 000-default
                rm -R /var/www/html/
        killall mysqld
        sleep 5s
        echo $(xmlstarlet sel -t -v 'yazgfs/config/pass' /etc/koha/sites/library/koha-conf.xml)
        #needed for fix problem with ubuntu and cron
        koha-post-install-setup
        update-locale 
        date > /etc/configured
fi
