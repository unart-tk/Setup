#!/bin/sh

set -u
set -e

# This installs a minimal home environment.
# The idea is to feel at home as quick as possible

kit=$HOME/kit

if [ ! -d "$kit" ]; then
    echo "Error: main directory $kit doesn't exist"
    exit 1
fi

#  ### dotfiles

dotfiles="$kit/Shellconfig/dotfiles"
bashconfig="$dotfiles/bashconfig"
termconfig="$dotfiles/termconfig"
toolsconfig="$dotfiles/toolsconfig"
xconfig="$dotfiles/xconfig"

vimdotfiles="$kit/Vimconfig/vimdotfiles"

dfiles="$bashconfig $termconfig $toolsconfig $xconfig $vimdotfiles"
for dx in $(find $dfiles -maxdepth 1 ); do
        dn=$(basename "$dx")
        rm -rf "$HOME/.$dn"
        ln -s "$dx" "$HOME/.$dn"
done


# vim bundles, the 'pathogen' method:
vibundle=$kit/vibundle
if [ -d $HOME/.vim ]; then
    rm -rf $HOME/.vim/bundle
    mkdir $HOME/.vim/bundle

    for d in $vibundle/*; do
        dn=$(basename $d)
        ln -s $d $HOME/.vim/bundle/$dn
    done
fi


