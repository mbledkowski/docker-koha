#!/bin/bash

/usr/bin/mysqld_safe &
 sleep 10s

 mysqladmin -u root password mysqlpsswd
 mysqladmin -u root -pmysqlpsswd reload
 mysqladmin -u root -pmysqlpsswd create koha
 
 echo "GRANT ALL ON koha.* TO kohaadmin@localhost IDENTIFIED BY 'kohapsswd'; flush privileges; " | mysql -u root -pmysqlpsswd
 
 a2enmod rewrite
 koha-create --create-db library
 a2enmod deflate
 a2ensite library
 
killall mysqld
sleep 10s
