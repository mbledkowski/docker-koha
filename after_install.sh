#!/bin/sh
#need to be added after_install scritp to get password of default user koha_library

xmlstarlet sel -t -v 'yazgfs/config/pass' /etc/koha/sites/library/koha-conf.xml
