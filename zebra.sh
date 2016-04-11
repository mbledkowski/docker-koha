#!/bin/bash
### In zebra.sh (make sure this file is chmod +x):
# `chpst -u root` runs the given command as the user `root`.
# If you omit that part, the command will be run as root.

exec chpst -u root koha-start-zebra library 2>&1
