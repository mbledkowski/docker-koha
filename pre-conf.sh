#!/bin/bash

/usr/bin/mysqld_safe &
 sleep 10s

 mysqladmin -u root password mysqlpsswd
 mysqladmin -u root -pmysqlpsswd reload
 mysqladmin -u root -pmysqlpsswd create koha
 
 echo "GRANT ALL ON koha.* TO kohaadmin@localhost IDENTIFIED BY 'kohapsswd'; flush privileges; " | mysql -u root -pmysqlpsswd
 

killall mysqld
sleep 10s
