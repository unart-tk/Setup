#!/bin/sh

set -e
set -u


. ./0-setup.sh


# directly link tools

rm -f $HOME/tools
ln -s $toolkit/Tools $HOME/tools


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

# directly link Sw

ln -s $toolkit/Sw $bin/sw

dirs="echo $kit/*aliases $kit/*tools $kit/*utils $kit/*scripts)"
for d in $dirs; do
    [ -d "$d" ] && {
        dn=$(basename $d)
        ld=$(perl -e 'print(lc $ARGV[0]);' $dn)
        ln -s $d $bin/$ld
    }
done



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
