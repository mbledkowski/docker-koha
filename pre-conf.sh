#!/bin/bash

/usr/bin/mysqld_safe &
 sleep 10s

 mysqladmin -u root password mysqlpsswd
 mysqladmin -u root -pmysqlpsswd reload
 mysqladmin -u root -pmysqlpsswd create koha
 
 echo "GRANT ALL ON koha.* TO kohaadmin@localhost IDENTIFIED BY 'katikoan'; flush privileges; " | mysql -u root -pmysqlpsswd
 
 cd /opt
 wget https://github.com/liblime/LibLime-Koha/archive/v4.18.06.tar.gz
 tar -xvf v4.18.06.tar.gz
 rm v4.18.06.tar.gz
 mv LibLime-Koha-4.18.06 koha
 cd  koha/
 perl Makefile.PL
 make
 make test
 make install
 KOHA_CONF=/opt/koha/etc/koha-conf.xml plackup app.psgi
 
 
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
