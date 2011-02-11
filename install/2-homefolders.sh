#!/bin/sh

set -e
set -u


. ./0-setup.sh



# KIT

kit=$HOME/kit

rm -rf $kit
mkdir $kit


dirs=$( echo $aux/*kit )
for d in $dirs; do
    [ -n "$d/*" ] &&
    for dr in $d/*; do
        drn=$(basename $dr)
        ln -s $dr $kit/$drn
    done
done



# IDE
# ---

ide=$HOME/ide
rm -rf $ide
mkdir -p $ide


ln -s $HOME/dev/aux.scm/vide.ben.public/* $HOME/ide/
ln -s $HOME/dev/aux.scm/vibundle.ben.public $HOME/ide/vibundle


# BIN
# ---

bin=$HOME/bin
rm -rf $bin
mkdir -p $bin

dirs="echo $kit/*aliases $kit/Sw $kit/*tools $kit/*utils $kit/*scripts $kit/Tools $kit/Utils $kit/*bins )"
for d in $dirs; do
    [ -d "$d" ] && {
        dn=$(basename $d)
        ld=$(perl -e 'print(lc $ARGV[0]);' $dn)
        ln -s $d $bin/$ld
    }
done


# opt
ln $HOME/aux/opt $bin/opt

# ETC
# ---

etc=$HOME/etc
rm -rf $etc
mkdir -p $etc


dirs="$( echo $kit/*config $kit/*setup $kit/*passwords $kit/Passwords )"

for d in $dirs; do
    [ -d "$d" ] && {
        dn=$(basename $d)
        ld=$(perl -e 'print(lc $ARGV[0]);' $dn)
        ln -s $d $etc/$ld
    }
done

# DOC 
# ---

doc=$HOME/doc
rm -rf $doc
mkdir -p $doc


dirs="$(echo $kit/*note* $kit/*doc* $kit/*page* $kit/Cheat* $kit/*guides )"
for d in $dirs; do
    [ -d "$d" ] && {
        dn=$(basename $d)
        ld=$(perl -e 'print(lc $ARGV[0]);' $dn)
        ln -s $d $doc/$ld
    }
done
