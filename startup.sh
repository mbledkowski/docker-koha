#!/bin/bash

apt update -y
apt full-upgrade -y

if [ -f /etc/configured ]; then
        a2enmod rewrite
        a2enmod suexec
        a2enmod cgi
        echo 'already configured'
else
        #code that need to run only one time ....
        chown -R mysql:mysql /var/lib/mysql 
        #Initial conf for mysql
        mysql_install_db
        /usr/bin/mysqld_safe &
        sleep 5s
                a2enmod rewrite
                a2enmod suexec
                a2enmod cgi
                koha-create --create-db library
                #security tweak
                mysqladmin -u root password mysqlpsswd
                mysqladmin -u root -pmysqlpsswd reload
                echo 'it works'
                if [ -f /database/koha_library.sql ]
                then
                        mysql -u root -pmysqlpsswd -e "drop database koha_library"
                        mysql -u root -pmysqlpsswd -e "create database koha_library"
                        mysql -u root -pmysqlpsswd koha_library < /database/koha_library.sql
                        koha-upgrade-schema library
                        koha-rebuild-zebra -v -f library
                        echo 'database imported'
                fi
                a2dissite 000-default
                rm -R /var/www/html/
        killall mysqld mysqld_safe
        sleep 5s
        echo "Password:  $(xmlstarlet sel -t -v 'yazgfs/config/pass' /etc/koha/sites/library/koha-conf.xml)"
        #needed for fix problem with ubuntu and cron
        update-locale 
        date > /etc/configured
fi
