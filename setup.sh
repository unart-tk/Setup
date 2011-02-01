#!/bin/sh

set -e
set -u

url='http://untar.org/files/downloads'

base=$HOME/base
dl=$base/download
pkgs=$base/packages

mode=
if [ "$#" = 1 ]; then
    mode="$1"
fi

if [ ! -d $base ]; then
    mkdir $base
fi
if [ ! -d $pkgs ]; then
    mkdir -p $pkgs
fi

rm -rf $dl
mkdir $dl
cd $dl

for r in openkit sw vibundle; do
        if [ "$mode"  = 'nodl' ] ; then
            if [ ! -f $pkgs/${r}.ben.public.tar.gz ] ; then
                echo "Error: package $r.ben.public.tar.gz not downloaded yet, run in normal mode."
                exit 1
            else
                cd $pkgs
                rm -rf ${r}.ben.public
                tar xfvz "${r}".ben.public.tar.gz
            fi
        else
            cd $dl
            rm -rf $dl/${r}.ben.public.tar.gz
            wget ${url}/${r}.ben.public.tar.gz
            tar xfvz ${r}.ben.public.tar.gz
            rm -rf $pkgs/${r}.ben.public 
            mv ${r}.ben.public $pkgs/
        fi
done

cd $base
rm -rf $dl
echo Finito

