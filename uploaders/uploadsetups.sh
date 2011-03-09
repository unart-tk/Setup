#!/bin/sh

#  upload.sh - 
#  
# 
set -u
set -e

cwd=`pwd`/..
for s in "$cwd"/*.sh ; do
    scp "$s" picnic@joyent:~/untar.org/files/downloads/
done
