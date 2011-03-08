#!/bin/sh


# takes tars from install/download puts them into install/packages and copies them into ~/prog/dev/.
# overwrites nothing existing

set -e
set -u

install=$HOME/install
dl=$install/downloads
pkgs=$install/packages

codes=$HOME/codes
aux=$codes/aux.scm

mode=

if [ ! -d "$dl" ]; then
    echo "the dl folder $dl is empty"
    echo "run download.sh first"
    exit 1
fi

cd $dl

if [ "$#" = 1 ]; then
    mode="$1"
fi

[ -d "$codes" ] || mkdir $codes
[ -d "$aux" ] || mkdir -p $aux

rm -rf $pkgs
mkdir -p $pkgs


if [ -z "$(ls -A $dl)" ] ; then
    echo "Error: download $dl folder is empty"
    exit 1
 else
    for d in "$dl"/*; do
        dn=$(basename $d)
        dnf=$(echo $dn | sed 's/\.tar\.gz//g' )
        if [ ! -d "${aux}/${dnf}" ] ; then
            cd $dl
            echo tar xfz $dn -C $pkgs/
            echo cp -R $pkgs/$dnf $aux/$dnf
        else
            echo "Warning: ${aux}/${dnf} already exists. Omitting ..."
        fi
    done
fi
