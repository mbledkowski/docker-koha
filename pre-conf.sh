#!/bin/bash
set -e

 #apache2 conf
 #default ports /etc/apache2/ports.conf   need to add Listen 80  and 8080
 sed -i 's/DOMAIN=".myDNSname.org"/DOMAIN=""/' /etc/koha/koha-sites.conf
 # Testing if I can only used one port for everything
 sed -i 's/INTRAPORT="80"/INTRAPORT="8080"/' /etc/koha/koha-sites.conf
 sed -i 's/INTRASUFFIX="-intra"/INTRASUFFIX=""/' /etc/koha/koha-sites.conf
 echo "Listen 8080" >> /etc/apache2/ports.conf
 #need to add this to others container using apache2
 echo "ServerName localhost" | tee /etc/apache2/conf-available/fqdn.conf 
 ln -s /etc/apache2/conf-available/fqdn.conf /etc/apache2/conf-enabled/fqdn.conf
