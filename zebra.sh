#!/bin/sh
### In zebra.sh (make sure this file is chmod +x):
# `/sbin/setuser mysql` runs the given command as the user `mysql`.
# If you omit that part, the command will be run as root.

exec koha-start-zebra library >>/var/log/zebra.log 2>&1
