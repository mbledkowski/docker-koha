#!/bin/bash


set -e

if [ -f /etc/configured ]; then
        a2enmod rewrite
        a2enmod suexec
        a2enmod cgi
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
        echo "Password:  $(xmlstarlet sel -t -v 'yazgfs/config/pass' /etc/koha/sites/library/koha-conf.xml)"
        #needed for fix problem with ubuntu and cron
        update-locale 
        date > /etc/configured
fi
