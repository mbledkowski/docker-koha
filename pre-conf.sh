#!/bin/bash

/usr/bin/mysqld_safe &
 sleep 10s

 #need to edit or add file /etc/koha/koha-sites.conf
 a2enmod rewrite
 a2enmod cgi
 koha-create --create-db library

 #security tweak
  mysqladmin -u root password mysqlpsswd
  mysqladmin -u root -pmysqlpsswd reload

 #apache2 conf
 #default ports /etc/apache2/ports.conf   need to add Listen 80  and 8080

 a2enmod deflate
 a2ensite library

 #tweat /etc/hosts if nesesary ....

 #need to run only afte upgrade 
 #koha-rebuild-zebra -v -f library
 
killall mysqld
sleep 10s
