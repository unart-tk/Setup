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

ln -s $aux/sw $kit/
ln -s $aux/vibundle $kit/

# BIN
# ---

bin=$HOME/bin
rm -rf $bin
mkdir -p $bin

dirs="echo $kit/*tools $kit/*utils $kit/*scripts $kit/Tools $kit/Utils )"
for d in $dirs; do
    [ -d "$d" ] && {
        dn=$(basename $d)
        ld=$(perl -e 'print(lc $ARGV[0]);' $dn)
        ln -s $d $bin/$ld
    }
done

ln -s $sw $bin/sw

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
        ln -s $dr $etc/$ld
    }
done

# DOC 
# ---

doc=$HOME/doc
rm -rf $doc
mkdir -p $doc


dirs="$(echo $kit/*note* $kit/*doc* $kit/*page*)"
for d in $dirs; do
    [ -d "$d" ] && {
        dn=$(basename $d)
        ld=$(perl -e 'print(lc $ARGV[0]);' $dn)
        ln -s $dr $doc/$ld
    }
done
