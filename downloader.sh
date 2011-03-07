#!/bin/sh


url='http://untar.org/files/downloads'

install=$HOME/install

dl=$install/downloads

cur=`pwd`

rm -rf $dl
mkdir -p $dl
cd $dl

for r in toolkit sw vibundle; do
            cd $dl
            rm -rf $dl/${r}.ben.public*
            wget ${url}/${r}.ben.public.tar.gz
done

cd $cur
wget ${url}/prepinstall.sh
chmod 0755 prepinstall.sh
