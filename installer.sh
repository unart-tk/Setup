#!/bin/sh


# takes tars from install/download puts them into install/packages and copies them into ~/prog/dev/.
# overwrites nothing existing

set -e
set -u

url='http://untar.org/files/downloads'

install=$HOME/install
dl=$install/downloads
pkgs=$install/packages

prog=$HOME/prog
aux_prog=$prog/dev/aux.scm

mode=
if [ "$#" = 1 ]; then
    mode="$1"
fi

if [ ! -r "$prog" ]; then
    mkdir $prog
fi
if [ ! -r "$aux_prog" ]; then
    mkdir -p $aux_prog
fi

rm -rf $pkgs
mkdir -p $pkgs

if [ ! -d "$dl" ]; then
    echo "the dl folder $dl is empty"
    echo "run download.sh first"
    exit 1
fi

cd $dl

if [ -z "$(ls -A $dl)" ] ; then
    echo "Error: download $dl folder is empty"
    exit 1
 else
    for d in "$dl"/*; do
        dn=$(basename $d)
        dnf=$(echo $dn | sed 's/\.tar\.gz//g' )
        if [ ! -d "${aux_prog}/${dnf}" ] ; then
            cd $dl
            tar xfz $dn -C $pkgs/
            cp -R $pkgs/$dnf $aux_prog/$dnf
        fi
    done
fi
