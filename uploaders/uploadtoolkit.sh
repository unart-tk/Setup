#!/bin/sh

#  upload.sh - 
#  
# 
set -u
set -e

upload=$HOME/install/upload
rm -rf $upload
mkdir -p $upload

cp -R ~/codes/aux.scm/toolkit.ben.public $upload/

cd $upload

tar cfvz toolkit.ben.public.tar.gz toolkit.ben.public

scp toolkit.ben.public.tar.gz picnic@joyent:~/untar.org/files/downloads/

cd -
