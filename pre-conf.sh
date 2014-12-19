#!/bin/bash

/usr/bin/mysqld_safe &
 sleep 5s

 #apache2 conf
 #default ports /etc/apache2/ports.conf   need to add Listen 80  and 8080
 sed -i 's/INTRAPORT="80"/INTRAPORT="8080"/' /etc/koha/koha-sites.conf
 sed -i 's/INTRASUFFIX="-intra"/INTRASUFFIX=""/' /etc/koha/koha-sites.conf
 echo "Listen 8080" >> /etc/apache2/ports.conf
 #need to add this to others container using apache2
 echo "ServerName localhost" | sudo tee /etc/apache2/conf-available/fqdn.conf
 ln -s /etc/apache2/conf-available/fqdn.conf /etc/apache2/conf-enabled/fqdn.conf
 koha-post-install-setup
 #need to edit or add file /etc/koha/koha-sites.conf
 a2enmod cgi
 koha-create --create-db library
 #security tweak
  mysqladmin -u root password mysqlpsswd
  mysqladmin -u root -pmysqlpsswd reload
 a2dissite 000-default
 rm -R /var/www/html/

killall mysqld
sleep 5s
