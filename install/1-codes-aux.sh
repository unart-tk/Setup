#!/bin/sh

set -e
set -u

. ./0-setup.sh

cur=`pwd`


# codes
# ---
if [ ! -d "$codes_root" ] ; then
    echo "Error: No dir codes_root $codes_root"
    exit 1
fi
rm -f $codes
ln -s $codes_root $codes

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
       rm -f $HOME/$xrn
       ln -s $x  $HOME/$xrn

done



cd $cur
