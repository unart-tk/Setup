#!/bin/sh

set -e
set -u

. ./0-setup.sh

cur=`pwd`

# ~/prog is where the stuff from install is
pkgs=$prog/packages
mode=
if [ "$#" = 1 ]; then
    mode="$1"
fi

# Check ~/prog ( if the install ran )
if [ ! -d "$prog" ] ; then
    echo "Error: Run installer first."
    exit 1
fi

# dev
# ---
if [ ! -d "$dev_root" ] ; then
    echo "Error: No dir dev_root $dev_root"
    exit 1
fi
rm -f $dev
ln -s $dev_root $dev

# aux
# ---

if [ ! -d "$aux_root" ] ; then
    echo "Error: No aux dir in  $aux_root"
    exit 1
fi
rm -rf $aux
mkdir $aux

[ -n "$(ls -A -- $aux_root )" ] &&
for x in $aux_root/*; do
	    xn=$( basename $x )
	    xrn=$( echo $xn | sed 's/\..*//g' )
       ln -s $x  $aux/$xrn
done



cd $cur
