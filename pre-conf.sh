#!/bin/bash

/usr/bin/mysqld_safe &
 sleep 10s

 mysqladmin -u root password mysqlpsswd
 mysqladmin -u root -pmysqlpsswd reload
 mysqladmin -u root -pmysqlpsswd create koha
 
 echo "GRANT ALL ON drupal.* TO kohaadmin@localhost IDENTIFIED BY 'kohadbpasswd'; flush privileges; " | mysql -u root -pmysqlpsswd
 
 cd /opt
 wget 
 
 cd /opt
 wget http://archive.apache.org/dist/lucene/solr/4.9.1/solr-4.9.1.tgz
 tar -xvf solr-4.9.1.tgz
 rm solr-4.9.1.tgz
 cd solr-4.9.1/
 cp -a example koha
 rm -rf koha/solr/conf
 ln -s /opt/koha/etc/solr/conf ./koha/solr/conf


killall mysqld
sleep 10s
